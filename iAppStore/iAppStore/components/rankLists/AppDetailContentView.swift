//
//  AppDetailContentView.swift
//  iAppStore
//
//  Created by liqiang on 2/26/25.
//

import SwiftUI

enum AppDetailAlertType:Identifiable {
    case copyBundleId
    
    var id:Int {hashValue}
}

struct AppDetailContentView: View {
    @ObservedObject var appModel = AppDetailModel()
    @State private var alertType: AppDetailAlertType?

    var body: some View {
        if appModel.app == nil {
            Rectangle().overlay(Color.tsmg_tertiarySystemGroupedBackground)
                .cornerRadius(20)
                .padding(.all)
                .animation(.easeInOut, value: 9)
                .transition(.opacity)
        }else {
            ScrollView{
                AppdetailHeaderView(appModel: appModel, alertType: $alertType)
                    .contextMenu{
                        AppContextMenu(appleID: String(appModel.app?.trackId ?? 0), bundleID: appModel.app?.bundleId, appUrl: appModel.app?.trackViewUrl, developerUrl: appModel.app?.artistViewUrl, showAppDataSize: false)

                    }
                AppDetailScreenShowView(appModel: appModel)
            }
        }
    }
    
}

struct AppdetailHeaderView:View {
    @ObservedObject var appModel:AppDetailModel
    @Binding var alertType:AppDetailAlertType?
    var body: some View {
        ZStack{
            ImageLoaderView(url:appModel.app?.artworkUrl100) {
                Spacer()
            } image: {
                $0.resizable()
                    .blur(radius: 50, opaque: true)
                    .overlay(Color.black.opacity(0.25))
                    .animation(.easeInOut,value: 1)
                    .transition(.opacity)
            }
            if appModel.app == nil {
                Rectangle().foregroundStyle(.white).padding(.all).animation(.easeInOut, value: 0).transition(.opacity)
            }
            
            HStack(alignment:.top) {
                VStack(alignment:.center) {
                    ImageLoaderView(url:appModel.app?.artworkUrl512,placeholder:{
                        Image("icon_placeholder")
                            .resizable()
                            .renderingMode(.original)
                            .cornerRadius(20)
                            .frame(width: 100,height:100)
                    }) {
                        $0.resizable()
                            .renderingMode(.original)
                            .cornerRadius(20)
                            .frame(width: 100,height: 100)
                    }
                    Spacer().frame(height: 15)
                    Text("v\(appModel.app?.version ?? "")")
                        .foregroundStyle(Color.tsmg_systemBackground)
                    Spacer()
                    Text(appModel.app?.averageRating ?? "")
                        .foregroundStyle(Color.tsmg_systemBackground)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("满分 5 分").font(.footnote).foregroundStyle(Color.tsmg_systemBackground.opacity(0.5)).fontWeight(.heavy)
                    Spacer()
                }
                Spacer().frame(width: 20)
                VStack(alignment:.leading) {
                    AppDetailTextView(key: "价格", value: appModel.app?.formattedPrice ?? "")
                    AppDetailTextView(key: "分级", value: appModel.app?.contentAdvisoryRating ?? "")
                    AppDetailTextView(key: "分类", value: (appModel.app?.genres ?? []).joined(separator: ","))
                    AppDetailTextView(key: "App ID", value: String(appModel.app?.trackId ?? 0))
                    HStack {
                        Text("包名").font(.subheadline)
                        if #available(iOS 15.0, *) {
                            Button(appModel.app?.bundleId ?? "") {
                                alertType = .copyBundleId
                            }.buttonStyle(.bordered)
                        }else {
                            Button(appModel.app?.bundleId ?? "") {
                                alertType = .copyBundleId
                            }
                        }
                    }
                    AppDetailTextView(key: "开发者", value: appModel.app?.artistName ?? "")
                    AppDetailTextView(key: "上架时间", value: appModel.app?.releaseTime ?? "")
                }.foregroundStyle(Color.tsmg_systemBackground)
                Spacer()
            }.padding([.leading,.trailing],12).padding([.top,.bottom],18)

        }.frame(alignment: .top)
    }
}

struct AppDetailTextView:View {
    var key:String
    var value:String
    var body: some View {
        HStack {
            Text(key).font(.subheadline)
            Text(value).font(.subheadline).fontWeight(.bold)
        }.padding(1)
    }
}

struct AppDetailScreenShowView:View {
    @ObservedObject var appModel:AppDetailModel
    @State private var extendiPadShot:Bool = false
    var body: some View {
        HStack {
            Text("预览").font(.title3).fontWeight(.bold).padding([.top,.bottom],12)
            Spacer()
        }
        VStack (alignment: .leading) {
            if appModel.app != nil && appModel.app!.isSupportiPhone {
                AppDetailScreenShotView(screenshotUrls: appModel.app?.screenshotUrls,imageSize: appModel.app?.screenShotSize)
                HStack {
                    Image(systemName: "iphone").foregroundStyle(.gray).font(.body)
                    if appModel.app!.isSupportiPad && !extendiPadShot {
                        Image(systemName: "ipad").foregroundStyle(.gray).font(.body)
                        Text("iPhone 和 iPad App").foregroundStyle(.gray).font(.footnote).fontWeight(.medium)
                        Spacer()
                        Image(systemName: "chevron.down").foregroundColor(.gray).font(.body)
                    }else {
                        Text("iPhone").foregroundStyle(.gray).font(.footnote).fontWeight(.medium)
                        Spacer()
                    }
                }
                .background(Color.tsmg_systemBackground)
                .padding([.leading,.trailing],12)
                .padding([.top,.bottom],10)
                .onTapGesture {
                    if appModel.app!.isSupportiPad {
                        extendiPadShot = true
                    }
                }
            }
        }.padding(.bottom,5)

        VStack(alignment: .leading) {
            if (appModel.app != nil && extendiPadShot) || (appModel.app != nil && !appModel.app!.isSupportiPhone && appModel.app!.isSupportiPad) {
                AppDetailScreenShotView(screenshotUrls: appModel.app?.ipadScreenshotUrls,imageSize:appModel.app?.screenShotSize)
                HStack {
                    Image(systemName: "ipad").foregroundStyle(.gray).font(.body)
                    Text("iPad").foregroundStyle(.gray).font(.footnote).fontWeight(.medium)
                    Spacer()
                }
                .padding([.leading,.trailing],12)
                .padding([.top,.bottom],10)
                
            }
        }.padding(.bottom,5)
        Divider().padding(.bottom,12).padding([.leading,.trailing],10)
    }
}
struct AppDetailScreenShotView:View {
    var screenshotUrls:[String]?
    var imageSize:CGSize?
    @State private var selectedShot:Bool = false
    @State private var selectedImgUrl:String?
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack() {
                ForEach(0..<(screenshotUrls ?? [String]()).count,id: \.self) { index in
                    let url = screenshotUrls![index]
                    Button {
                        selectedImgUrl = url.imageAppleScale()
                        selectedShot = true
                    } label: {
                        ImageLoaderView(url:url.imageAppleScale()) {
                            Image("icon_placeholder")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(11)
                                .frame(width:imageSize?.width)
                        } image: {
                            $0.resizable()
                                .scaledToFit()
                                .cornerRadius(11)
                                .overlay(RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray,lineWidth: 0.1)
                                    .frame(width: imageSize?.width, height: imageSize?.height))
                                .frame(width: imageSize?.width, height: imageSize?.height)
                        }

                    }
                    .padding([.leading,.trailing],3)
                    .sheet(isPresented: $selectedShot) {
                        
                    } content: {
                        AppDetailBigImageShowView(selectedShot: $selectedShot, selectedImgUrl: $selectedImgUrl)
                    }

                }
            }
        }
    }
}
struct AppDetailBigImageShowView :View {
    @Binding var selectedShot:Bool
    @Binding var selectedImgUrl:String?
    @State var showSheet = false
    @State private var shareImage:UIImage?
    
    var body: some View {
        HStack {
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "square.and.arrow.up").imageScale(.large)
                
            }
            .frame(width: 60,height: 60,alignment: .center)
            .padding([.top,.leading],8)
            .sheet(isPresented: $showSheet) {
                if let data = NSData(contentsOf: URL(string: selectedImgUrl!)!),
                   let img = UIImage(data: data as Data) {
                    ShareSheet(items: [img])
                }
            }
            Spacer()
            Button {
                selectedShot = false
            } label: {
                Image(systemName: "xmark.circle").imageScale(.large)
            }
            .frame(width: 60,height: 60,alignment: .center)
            .padding([.top,.trailing],8)
        }
        Spacer()
   

        ImageLoaderView(url:selectedImgUrl) {
            Image("icon_placeholder")
                .resizable()
                .scaledToFit()
        } image: {
            $0.resizable()
                .scaledToFit()
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray,lineWidth: 0.1))
        } completion: {img in
            DispatchQueue.main.async {
                shareImage = img
            }
        }
        .padding([.leading,.trailing],5)
        Spacer()
    }
}
#Preview {
    AppDetailContentView()
}
