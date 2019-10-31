import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class AboutUsScreen extends StatefulWidget {
    @override
    _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
    Widget _textWidget(text){
        return Text(
            text,
            style: TextStyle(
                fontSize: UISize.size(30),
                color: Color(0xff666666),
                height: UISize.height(2.6),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('关于我们'),
            ),
            body: ListView(
                children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(UISize.width(20)),
                        child: Column(
                            children: <Widget>[
                                _textWidget('        香港经纬集团由爱国华侨陈经纬博士于上世纪八十年代在香港创建。得益于中国改革开放的政策和国家经济蓬勃发展赋予的机会,香港经纬集团以锐利的战略目光,融入国家整体经济的高速发展,成为首批外商投资内地的港资企业。'),
                                SizedBox(width: double.infinity, height: UISize.height(20)),
                                _textWidget('        从成立至今,集团始终秉承“责任创造价值、使命催人奋进”的企业精神,在集团主席陈经纬博士的带领下一路披荆斩棘开拓商业疆土,并逐步开启多元化业务领域,已经形成地产、金融、紫荆谷和全球商品博览汇（IMX）四大核心业务板块的发展战略。'),
                                SizedBox(width: double.infinity, height: UISize.height(20)),
                                _textWidget('        香港经纬集团于2016年在泰国成立经纬集团（泰国）公共有限公司,并成功上市（股票代码：KWG.BK）,2018年收购亚太地区实力雄厚的财产保险公司,积极将业务版图延伸到海外,目前集团已成为放眼全球、多产业布局的新时代践行者。'),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}