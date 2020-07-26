package com.lc.qrcode;

import org.junit.Test;

import java.net.URISyntaxException;
import java.nio.file.Paths;

import static org.junit.Assert.*;

public class QRCodeUtilTest {

	@Test
	public void generateWxQRImage() throws Exception {
//		String txt = "https://open.weixin.qq.com/connect/oauth2/authorize?appid%3dwx8123a0ca9d8fad6b%26redirect_uri%3dhttp%3a%2f%2fc2927v1271.zicp.vip%3fd%3d%26c%3dwxAdapter%26m%3dmobileDeal%26showwxpaytitle%3d1%26vb2ctag%3d4_2030_5_1194_60%26response_type%3dcode%26scope%3dsnsapi_base%26state%3d123%23wechat_redirect";
		String txt = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8123a0ca9d8fad6b&redirect_uri=http%3a%2f%2fc2927v1271.zicp.vip%2fpay%2ftoken%2fwx%2f110020541%2f19.00&response_type=code&scope=snsapi_base&state=asdf2wr234112#wechat_redirect";
		String path = Paths.get(ZxingUtil01.class.getResource("/static/images").toURI()).toAbsolutePath().toString();
		QRCodeUtil.generateQRImage(txt,path+"/hotwind.jpg",path,"qrcode-wx.jpg","jpg");
	}


	@Test
	public void generateAliQRImage() throws Exception {
		String txt = "https://openauth.alipaydev.com/oauth2/publicAppAuthorize.htm?app_id=2021001167681733&scope=auth_base&redirect_uri=http%3a%2f%2fc2927v1271.zicp.vip%2fgetAliUserId%3fparam%3d1";

		String path = Paths.get(ZxingUtil01.class.getResource("/static/images").toURI()).toAbsolutePath().toString();
		QRCodeUtil.generateQRImage(txt,path+"/hotwind.jpg",path,"qrcode-ali.jpg","jpg");
	}
}