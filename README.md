# MapboxExample


<div id="article_content" class="article_content csdn-tracking-statistics" data-pid="blog"  data-mod=popu_307  data-dsm = "post" >

<h1>一、简介：</h1>
<div><img src="http://img.blog.csdn.net/20180127154436154?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1138" height="331" alt=""><br>
</div>
<div>Mapbox致力于打造全球最漂亮的个性化地图。<br>
</div>
<div><br>
</div>
<div>在一次偶然的地图相关资料搜索过程中发现了一个很神奇又很漂亮的地图，这个地图支持高度自定义各种地图元素，比如，道路，水系，绿地，建筑物，背景色，等等。Mapbox打造的Mapbox studio地图制作虚拟工作室，就是一个很完美的地图元素个性化编辑器。另外，我们也可以把自己项目的地理信息数据上传到Mapbox云端，然后在自己项目的客户端展现出来。</div>
<div><br>
</div>
<div>Mapbox地图数据来源于Open Street Map（OSM）等其他地图数据供应商，和Google Map、Apple Map等地图厂商的地图数据来源差不多。</div>
<div><br>
</div>
<div><br>
</div>
<h1>二、使用：</h1>
<h2>1、注册账号：</h2>
<div>在&nbsp;<a target="_blank" target="_blank" href="https://www.mapbox.com">https://www.mapbox.com</a>&nbsp;网址找到 sign up&nbsp;注册一个开发者账号。</div>
<div><img src="http://img.blog.csdn.net/20180127155752251?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1390" height="780" alt=""><br>
</div>
<div>进入个人中心后，我们能看到 Integrate Mapbox 字样，我们点进去，然后根据网页的引导，我们最终会得到一个</div>
<div>和我们的项目相关的 Access tokens ，这个 tokens 就是我们访问SDK的唯一key，</div>
<div><br>
</div>
<div><img src="http://img.blog.csdn.net/20180127160759088?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="388" height="277" alt=""><br>
</div>
<div><img src="http://img.blog.csdn.net/20180127161220727?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1400" height="800" alt=""><br>
</div>
<div>选择SDK平台，这里我们选择iOS</div>
<div><img src="http://img.blog.csdn.net/20180127161408682?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1400" height="800" alt=""><br>
</div>
<div>然后选择 Cocoapod 安装方式：</div>
<div><img src="http://img.blog.csdn.net/20180127161458557?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1400" height="700" alt=""><br>
</div>
<div>再接下来我们就能看到 Access tokens 了：</div>
<div><img src="http://img.blog.csdn.net/20180127161823662?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" align="middle" width="1400" height="700" alt=""><br>
</div>
<h2>2、引入工程：</h2>
<div>这里我们使用下载好的 Mapbox.framework 做示例，当然使用 cocoa pod 也行。</div>
<div>
<ul>
<li>把Mapbox.frameworks 文件拖拽到 “ 项目 -&gt; TARGETS -&gt; Build Phases -&gt; Embed Frameworks ” 这个路径下；</li><li>在路径 “项目 -&gt; TARGETS -&gt; Build Phases -&gt; &nbsp;&#43; &nbsp;-&gt; New Run Script phase” 粘贴一串 shel l脚本代码 ：&nbsp;<pre name="code" class="plain">bash &quot;${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Mapbox.framework/strip-frameworks.sh&quot;</pre></li></ul>
</div>
<div><br>
</div>
<div><img src="http://img.blog.csdn.net/20180127163002720?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1400" height="700" alt=""><br>
</div>
<div><br>
</div>
<div>接下来把我们的 Access tokens 填写到项目工程的 Info.plist 文件中：</div>
<div>
<ul>
<li>&nbsp;在Info.plist 文件中添加 key 为 <span style="color:rgb(31,51,73); font-family:Menlo,&quot;Bitstream Vera Sans Mono&quot;,Monaco,Consolas,monospace; font-size:13.5px; white-space:pre-wrap">
MGLMapboxAccessToken</span>&nbsp;其&#20540;为【Access tokens】 字符串；</li><li>&nbsp;在Info.plist 文件中添加 key 为 <span style="color:rgb(31,51,73); font-family:Menlo,&quot;Bitstream Vera Sans Mono&quot;,Monaco,Consolas,monospace; font-size:13.5px; white-space:pre-wrap">
NSLocationWhenInUseUsageDescription</span>&nbsp;其&#20540;为 bool 类型的 YES;</li></ul>
&nbsp; &nbsp;<img src="http://img.blog.csdn.net/20180127163451789?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1400" height="600" alt=""></div>
<div><br>
</div>
<h2>3、Mapbox.framework类的使用：</h2>
<h3>【1】加载地图：</h3>
<div><pre name="code" class="objc">#import &quot;LoadMapboxViewController.h&quot;
#import &lt;Mapbox/Mapbox.h&gt;

@interface LoadMapboxViewController ()&lt;MGLMapViewDelegate&gt;

@property (nonatomic, strong) MGLMapView *mapView;

@end

@implementation LoadMapboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @&quot;加载地图&quot;;
    
    [self.view addSubview:self.mapView];
}

- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@&quot;mapbox://styles/mapbox/streets-v10&quot;]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:15 animated:YES];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeFollow;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}

@end</pre><br>
<img src="http://img.blog.csdn.net/20180130144832938?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="500" height="1000" alt=""><br>
</div>
<h3>【2】加载各种样式的地图：</h3>
<div>我们可以通过如下代码修改地图样式：</div>
<div><pre name="code" class="objc">[self.mapView setStyleURL:[NSURL URLWithString:@&quot;mapbox://styles/mapbox/streets-v10&quot;]];
</pre>这是所有地图已经做好的模板样式参数：<br>
</div>
<div>
<p style="margin-bottom:0px; font-size:12px; line-height:normal; font-family:&quot;Helvetica Neue&quot;; color:rgb(69,69,69)">
</p>
<ul>
<li><span style="font-size:12px">mapbox://styles/mapbox/streets-v10</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/outdoors-v10</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/light-v9</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/dark-v9</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/satellite-v9</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/satellite-streets-v10</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/navigation-preview-day-v2</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/navigation-preview-night-v2</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/navigation-guidance-day-v2</span></li><li><span style="font-size:12px">mapbox://styles/mapbox/navigation-guidance-night-v2</span></li></ul>
<p></p>
<div><br>
</div>
使用不同的参数呈现出来的地图风&#26684;变不一样。</div>
<div><img src="http://img.blog.csdn.net/20180130162440194?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1000" height="350" alt=""><br>
</div>
<h3>【3】加载大头针和默认气泡：</h3>
<div><pre name="code" class="objc">//
//  DefaultAnnotationCalloutViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright &copy; 2018年 wangzhengang. All rights reserved.
//

#import &quot;DefaultAnnotationCalloutViewController.h&quot;
#import &lt;Mapbox/Mapbox.h&gt;

@interface DefaultAnnotationCalloutViewController ()&lt;MGLMapViewDelegate&gt;
@property (nonatomic, strong) MGLMapView *mapView;
@property (nonatomic, copy) NSArray *annotationsArray;
@end

@implementation DefaultAnnotationCalloutViewController

- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@&quot;mapbox://styles/mapbox/streets-v10&quot;]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:15 animated:NO];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeNone;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}

- (NSArray *)annotationsArray {
    if (_annotationsArray == nil) {
        CLLocationCoordinate2D coords[2];
        coords[0] = CLLocationCoordinate2DMake(39.980528, 116.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 116.306745);
        NSMutableArray *pointsArray = [NSMutableArray array];
        for (NSInteger i = 0; i &lt; 2; ++i) {
            MGLPointAnnotation *pointAnnotation = [[MGLPointAnnotation alloc] init];
            pointAnnotation.coordinate  = coords[i];
            pointAnnotation.title       = [NSString stringWithFormat:@&quot;title：%ld&quot;, (long)i];
            pointAnnotation.subtitle    = [NSString stringWithFormat:@&quot;subtitle: %ld%ld%ld&quot;, (long)i,(long)i,(long)i];
            [pointsArray addObject:pointAnnotation];
        }
        _annotationsArray = [pointsArray copy];
    }
    return _annotationsArray;
}

#pragma mark MGLMapViewDelegate

- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView {
    ///地图加载完成时加载大头针
    [mapView addAnnotations:self.annotationsArray];
}

- (MGLAnnotationView *)mapView:(MGLMapView *)mapView viewForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    if (![annotation isKindOfClass:[MGLPointAnnotation class]]) {
        return nil;
    }
    MGLAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@&quot;MGLAnnotationView&quot;];
    if (annotationView == nil) {
        annotationView = [[MGLAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@&quot;MGLAnnotationView&quot;];
        [annotationView setFrame:CGRectMake(0, 0, 40, 40)];
        [annotationView setBackgroundColor:[UIColor redColor]];
        annotationView.layer.cornerRadius = 20.f;
        annotationView.layer.masksToBounds= YES;
        annotationView.layer.borderColor  = [UIColor whiteColor].CGColor;
        annotationView.layer.borderWidth  = 5.f;
    }
    return annotationView;
}

///是否显示气泡
-(BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id&lt;MGLAnnotation&gt;)annotation {
    return YES;
}
///完成加载大头针
- (void)mapView:(MGLMapView *)mapView didAddAnnotationViews:(NSArray&lt;MGLAnnotationView *&gt; *)annotationViews {
    [mapView showAnnotations:self.annotationsArray edgePadding:UIEdgeInsetsMake(100, 50, 100, 50) animated:YES];
}

///气泡左侧视图
- (UIView *)mapView:(MGLMapView *)mapView leftCalloutAccessoryViewForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor= [UIColor blueColor];
    UILabel *lab        = [[UILabel alloc] initWithFrame:view.bounds];
    lab.text            = @&quot;左侧视图&quot;;
    lab.textColor       = [UIColor whiteColor];
    lab.font            = [UIFont systemFontOfSize:10];
    lab.textAlignment   = NSTextAlignmentCenter;
    [view addSubview:lab];
    return view;
}
///气泡右侧视图，
- (UIView *)mapView:(MGLMapView *)mapView rightCalloutAccessoryViewForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor= [UIColor greenColor];
    UILabel *lab        = [[UILabel alloc] initWithFrame:view.bounds];
    lab.text            = @&quot;右侧视图&quot;;
    lab.textColor       = [UIColor blackColor];
    lab.font            = [UIFont systemFontOfSize:10];
    [view addSubview:lab];
    return view;
}




@end
</pre><img src="http://img.blog.csdn.net/20180130180036981?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="500" height="800" alt=""></div>
<h3>【4】加载图片大头针和自定义气泡：</h3>
<div>
<ul>
<li>
<div style="text-align:justify"></div>
</li></ul>
<div style="text-align:justify">
<ul>
<li>创建一个继承 <span style="background-color:rgb(204,204,204)">UIview</span> 的类 <span style="color:rgb(0,0,0); font-family:Menlo; font-size:14px; background-color:rgb(204,204,204)">
CustomeMapViewCalloutView</span>&nbsp; 并遵守 <span style="background-color:rgb(204,204,204)">
<span style="font-size:18px; color:#330033">&lt;&nbsp;</span></span><span style="font-family:Menlo; background-color:rgb(204,204,204)"><span style="font-size:18px; color:#330033">MGLCalloutView &gt;</span></span><span style="color:rgb(52,149,175); font-family:Menlo; font-size:11px; background-color:rgb(255,255,255)">&nbsp;</span><span style="font-family:Menlo; background-color:rgb(255,255,255)"><span style="font-size:18px; color:#330033">这个协议；</span></span><span style="color:rgb(52,149,175); font-family:Menlo; font-size:11px; background-color:rgb(255,255,255)">&nbsp;
 &nbsp; &nbsp;&nbsp;</span></li><li><span style="font-family:Menlo; background-color:rgb(255,255,255)"><span style="text-align:justify"><span style="font-size:18px; color:#330033">在</span><span style="color:#3495af; font-size:11px">&nbsp;</span></span><span style="font-size:14px; color:rgb(0,0,0); font-family:Menlo; background-color:rgb(204,204,204)">CustomeMapViewCalloutView</span><span style="font-size:11px; color:rgb(52,149,175); text-align:justify">&nbsp;</span><span style="text-align:justify"><span style="font-size:18px; color:#330033">中实现各种需求；</span></span><br>
</span></li><li><span style="font-family:Menlo; font-size:18px; color:#330033"><span style="background-color:rgb(255,255,255)">在 MapView 所在的 ViewController 中引入<span style="font-family:Menlo; font-size:14px; color:rgb(0,0,0); background-color:rgb(204,204,204)">CustomeMapViewCalloutView</span><span style="font-family:Menlo; text-align:justify; background-color:rgb(255,255,255); font-size:11px; color:rgb(52,149,175)">&nbsp;</span><span style="font-family:Menlo; text-align:justify; background-color:rgb(255,255,255)">；</span>&nbsp;
 &nbsp;</span></span></li></ul>
</div>
<div style="text-align:justify"><span style="font-family:Menlo; color:#3495af"><span style="font-size:11px; background-color:rgb(255,255,255)"><br>
</span></span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div style="text-align:justify">实现自定义callout view：<br>
<pre name="code" class="objc">//
//  CustomeMapViewCalloutView.h
//  Etoury
//
//  Created by iron on 2017/5/21.
//  Copyright &copy; 2017年 iron. All rights reserved.
//

#import &lt;UIKit/UIKit.h&gt;
#import &lt;Mapbox/Mapbox.h&gt;

@interface CustomeMapViewCalloutView : UIView&lt;MGLCalloutView&gt;



@end
</pre><pre name="code" class="objc">//
//  CustomeMapViewCalloutView.m
//  Etoury
//
//  Created by iron on 2017/5/21.
//  Copyright &copy; 2017年 iron. All rights reserved.
//

#import &quot;CustomeMapViewCalloutView.h&quot;

// Set defaults for custom tip drawing
static CGFloat const tipHeight = 10.0;
static CGFloat const tipWidth = 20.0;

@interface CustomeMapViewCalloutView ()
@property (strong, nonatomic) UIButton *mainBody;
@end

@implementation CustomeMapViewCalloutView {
    id &lt;MGLAnnotation&gt; _representedObject;
    __unused UIView *_leftAccessoryView;/* unused */
    __unused UIView *_rightAccessoryView;/* unused */
    __weak id &lt;MGLCalloutViewDelegate&gt; _delegate;
    BOOL _dismissesAutomatically;
    BOOL _anchoredToAnnotation;
}

@synthesize representedObject = _representedObject;
@synthesize leftAccessoryView = _leftAccessoryView;/* unused */
@synthesize rightAccessoryView = _rightAccessoryView;/* unused */
@synthesize delegate = _delegate;
@synthesize anchoredToAnnotation = _anchoredToAnnotation;
@synthesize dismissesAutomatically = _dismissesAutomatically;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        // Create and add a subview to hold the callout’s text
        UIButton *mainBody = [UIButton buttonWithType:UIButtonTypeSystem];
        mainBody.backgroundColor = [self backgroundColorForCallout];
        mainBody.tintColor = [UIColor whiteColor];
        mainBody.contentEdgeInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
        mainBody.layer.cornerRadius = 4.0;
        self.mainBody = mainBody;
        
        [self addSubview:self.mainBody];
    }
    
    return self;
}


#pragma mark - MGLCalloutView API

- (void)presentCalloutFromRect:(CGRect)rect inView:(UIView *)view constrainedToView:(UIView *)constrainedView animated:(BOOL)animated
{
    // Do not show a callout if there is no title set for the annotation
    if (![self.representedObject respondsToSelector:@selector(title)])
    {
        return;
    }
    
    [view addSubview:self];
    
    // Prepare title label
    [self.mainBody setTitle:self.representedObject.title forState:UIControlStateNormal];
    [self.mainBody sizeToFit];
    
    if ([self isCalloutTappable])
    {
        // Handle taps and eventually try to send them to the delegate (usually the map view)
        [self.mainBody addTarget:self action:@selector(calloutTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        // Disable tapping and highlighting
        self.mainBody.userInteractionEnabled = NO;
    }
    
    // Prepare our frame, adding extra space at the bottom for the tip
    CGFloat frameWidth = self.mainBody.bounds.size.width;
    CGFloat frameHeight = self.mainBody.bounds.size.height + tipHeight;
    CGFloat frameOriginX = rect.origin.x + (rect.size.width/2.0) - (frameWidth/2.0);
    CGFloat frameOriginY = rect.origin.y - frameHeight;
    self.frame = CGRectMake(frameOriginX, frameOriginY,
                            frameWidth, frameHeight);
    
    if (animated)
    {
        self.alpha = 0.0;
        
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1.0;
        }];
    }
}

- (void)dismissCalloutAnimated:(BOOL)animated
{
    if (self.superview)
    {
        if (animated)
        {
            [UIView animateWithDuration:0.2 animations:^{
                self.alpha = 0.0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
        else
        {
            [self removeFromSuperview];
        }
    }
}

// Allow the callout to remain open during panning.
- (BOOL)dismissesAutomatically {
    return NO;
}

- (BOOL)isAnchoredToAnnotation {
    return YES;
}

// https://github.com/mapbox/mapbox-gl-native/issues/9228
- (void)setCenter:(CGPoint)center {
    center.y = center.y - CGRectGetMidY(self.bounds);
    [super setCenter:center];
}

#pragma mark - Callout interaction handlers

- (BOOL)isCalloutTappable
{
    if ([self.delegate respondsToSelector:@selector(calloutViewShouldHighlight:)]) {
        return [self.delegate performSelector:@selector(calloutViewShouldHighlight:) withObject:self];
    }
    
    return NO;
}

- (void)calloutTapped
{
    if ([self isCalloutTappable] &amp;&amp; [self.delegate respondsToSelector:@selector(calloutViewTapped:)])
    {
        [self.delegate performSelector:@selector(calloutViewTapped:) withObject:self];
    }
}

#pragma mark - Custom view styling

- (UIColor *)backgroundColorForCallout
{
    return [UIColor darkGrayColor];
}

- (void)drawRect:(CGRect)rect
{
    // Draw the pointed tip at the bottom
    UIColor *fillColor = [self backgroundColorForCallout];
    
    CGFloat tipLeft = rect.origin.x + (rect.size.width / 2.0) - (tipWidth / 2.0);
    CGPoint tipBottom = CGPointMake(rect.origin.x + (rect.size.width / 2.0), rect.origin.y + rect.size.height);
    CGFloat heightWithoutTip = rect.size.height - tipHeight - 1;
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef tipPath = CGPathCreateMutable();
    CGPathMoveToPoint(tipPath, NULL, tipLeft, heightWithoutTip);
    CGPathAddLineToPoint(tipPath, NULL, tipBottom.x, tipBottom.y);
    CGPathAddLineToPoint(tipPath, NULL, tipLeft + tipWidth, heightWithoutTip);
    CGPathCloseSubpath(tipPath);
    
    [fillColor setFill];
    CGContextAddPath(currentContext, tipPath);
    CGContextFillPath(currentContext);
    CGPathRelease(tipPath);
}





@end
</pre><br>
在view controller中使用自定义的callout view：</div>
<div style="text-align:justify"><pre name="code" class="objc">//
//  CustomeAnnotationCalloutViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright &copy; 2018年 wangzhengang. All rights reserved.
//

#import &quot;CustomeAnnotationCalloutViewController.h&quot;
#import &lt;Mapbox/Mapbox.h&gt;
#import &quot;CustomeMapViewCalloutView.h&quot;

@interface CustomeAnnotationCalloutViewController ()&lt;MGLMapViewDelegate&gt;
@property (nonatomic, strong) MGLMapView *mapView;
@property (nonatomic, copy) NSArray *annotationsArray;

@end

@implementation CustomeAnnotationCalloutViewController


- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
}


- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@&quot;mapbox://styles/mapbox/streets-v10&quot;]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:15 animated:NO];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeNone;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}

- (NSArray *)annotationsArray {
    if (_annotationsArray == nil) {
        CLLocationCoordinate2D coords[2];
        coords[0] = CLLocationCoordinate2DMake(39.980528, 116.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 116.306745);
        NSMutableArray *pointsArray = [NSMutableArray array];
        for (NSInteger i = 0; i &lt; 2; ++i) {
            MGLPointAnnotation *pointAnnotation = [[MGLPointAnnotation alloc] init];
            pointAnnotation.coordinate  = coords[i];
            pointAnnotation.title       = [NSString stringWithFormat:@&quot;title：%ld&quot;, (long)i];
            pointAnnotation.subtitle    = [NSString stringWithFormat:@&quot;subtitle: %ld%ld%ld&quot;, (long)i,(long)i,(long)i];
            [pointsArray addObject:pointAnnotation];
        }
        _annotationsArray = [pointsArray copy];
    }
    return _annotationsArray;
}


#pragma mark MGLMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView {
    ///地图加载完成时加载大头针
    [mapView addAnnotations:self.annotationsArray];
}

- (MGLAnnotationView *)mapView:(MGLMapView *)mapView viewForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    if (![annotation isKindOfClass:[MGLPointAnnotation class]]) {
        return nil;
    }
    MGLAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@&quot;MGLAnnotationView&quot;];
    if (annotationView == nil) {
        annotationView = [[MGLAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@&quot;MGLAnnotationView&quot;];
        [annotationView setFrame:CGRectMake(0, 0, 40, 40)];
        [annotationView setBackgroundColor:[UIColor redColor]];
        annotationView.layer.cornerRadius = 20.f;
        annotationView.layer.masksToBounds= YES;
        annotationView.layer.borderColor  = [UIColor whiteColor].CGColor;
        annotationView.layer.borderWidth  = 5.f;
    }
    return annotationView;
}

///是否显示气泡
-(BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id&lt;MGLAnnotation&gt;)annotation {
    return YES;
}
///完成加载大头针
- (void)mapView:(MGLMapView *)mapView didAddAnnotationViews:(NSArray&lt;MGLAnnotationView *&gt; *)annotationViews {
    [mapView showAnnotations:self.annotationsArray edgePadding:UIEdgeInsetsMake(100, 50, 100, 50) animated:YES];
}

///加载定义callout view
- (id&lt;MGLCalloutView&gt;)mapView:(MGLMapView *)mapView calloutViewForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    CustomeMapViewCalloutView *calloutView = [[CustomeMapViewCalloutView alloc] init];
    calloutView.representedObject = annotation;
    return calloutView;
}

///气泡点击事件
- (void)mapView:(MGLMapView *)mapView tapOnCalloutForAnnotation:(id&lt;MGLAnnotation&gt;)annotation {
    NSLog(@&quot;点击了气泡: %@&quot;, annotation);
    [mapView deselectAnnotation:annotation animated:YES];
    
    [self showAlertControllerWithViewContorller:self title:@&quot;点击了气泡&quot; message:nil leftButtonTitle:nil rightButtonTitle:@&quot;确定&quot;];
}


#pragma mark - 警告框
- (void)showAlertControllerWithViewContorller:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftBtnTitle rightButtonTitle:(NSString *)rightBtnTitle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (leftBtnTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:leftBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
    }
    if (rightBtnTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:rightBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
    }
    [viewController presentViewController:alert animated:YES completion:nil];
}


@end
</pre>效果如下：</div>
<div style="text-align:justify"><img src="http://img.blog.csdn.net/20180130190623418?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="300" height="550" alt=""><img src="http://img.blog.csdn.net/20180130190646739?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="300" height="550" alt=""></div>
<h3>【5】绘制线段和多边形：</h3>
<div style="text-align:justify">老实说 Mapbox 的 绘制线段和多边形的相关类，相比高德地图和百度地图写的并不好，用起来很不方便，比如：</div>
<p style="margin-bottom:0px; line-height:normal"></p>
<ul style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;">
<li><span style="font-size:18px">&nbsp;MGLPolygon</span><span style="font-size:18px">&nbsp;有 strokeColor 这个参数，却没有设置 描边线宽度和样式的参数；</span></li><li><span style="font-size:18px">&nbsp;MGLPolyline 没有&nbsp;</span><span style="font-size:18px">strokeColor 和 fillColor 之分，而且画虚线的代码写起来很麻烦；</span></li></ul>
<span style="font-size:18px"><span style="font-family:Helvetica Neue; color:#454545">总体来讲，<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; text-align:justify">MGLPolygon 和&nbsp;<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; text-align:justify">MGLPolyline
 这两个类没有高德地图和百度地图那样使用起来方便，另外，<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; text-align:justify">MGLPolyline 这个类中的&nbsp;</span></span></span></span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;">MGLShapeSource 、</span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;">MGLStyleLayer
 虽然使用起来很麻烦，但是相对来说倒是保持了灵活性。</span></span>
<p></p>
<p style="margin-bottom:0px; line-height:normal"><br>
</p>
<p style="margin-bottom:0px; line-height:normal"><span style="font-family:Helvetica Neue; font-size:18px; color:#454545">为了提高&nbsp;<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; text-align:justify">MGLPolygon 和&nbsp;</span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;">MGLPolyline
 的使用便利性，我对</span></span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;"><span style="font-size:18px">&nbsp;<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;">MGLPolygon 、</span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; text-align:justify">MGLPolyline
 的基类 <span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; font-size:18px; text-align:justify">
MGLShape&nbsp;<span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; font-size:18px; text-align:justify">扩展</span></span>了几个属性：</span></span></span></p>
<p style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; margin-bottom:0px; font-size:12px; line-height:normal">
</p>
<ul>
<li>@property <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">(</span>nonatomic<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">,</span> strong<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">)</span> UIColor *fillColor<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">;</span>//<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">填充颜色</span></li><li>@property <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">(</span>nonatomic<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">,</span> assign<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">)</span> CGFloat fillOpacity<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">;</span>//<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">填充透明度</span></li><li>@property <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">(</span>nonatomic<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">,</span> strong<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">)</span> UIColor *strokeColor<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">;</span>//<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">描边颜色</span></li><li>@property <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">(</span>nonatomic<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">,</span> assign<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">)</span> BOOL isDash<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">;</span>//YES
 = <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">虚线／</span>NO = <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">
实线</span></li><li>@property <span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">(</span>nonatomic<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">,</span> assign<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">)</span> NSInteger strokeWeight<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">;</span>//<span style="line-height:normal; font-family:&quot;.PingFang SC&quot;">描边宽度</span></li></ul>
<p></p>
<div style="color:rgb(69,69,69); text-align:justify"><br>
</div>
<div style="color:rgb(69,69,69); text-align:justify">接下来让我们看看整体代码是如何实现的，以及最后的效果是怎样的：</div>
<div style="text-align:justify">
<p style="color:rgb(69,69,69); margin-bottom:0px; line-height:normal; font-family:&quot;Helvetica Neue&quot;">
<u><em><strong><span style="font-size:18px">MGLShape&#43;PolygonParamer.h</span></strong></em></u></p>
<pre name="code" class="objc" style="color: rgb(69, 69, 69);">//
//  MGLShape+PolygonParamer.h
//  Etoury
//
//  Created by dev on 2018/1/3.
//  Copyright &copy; 2018年 iron. All rights reserved.
//

#import &lt;Mapbox/Mapbox.h&gt;

@interface MGLShape (PolygonParamer)



@property (nonatomic, strong) UIColor *fillColor;//填充颜色
@property (nonatomic, assign) CGFloat fillOpacity;//填充透明度
@property (nonatomic, strong) UIColor *strokeColor;//描边颜色
@property (nonatomic, assign) BOOL isDash;//YES = 虚线／NO = 实线
@property (nonatomic, assign) NSInteger strokeWeight;//描边宽度




@end
</pre><br>
<p style="margin-bottom:0px; line-height:normal; font-family:Menlo; background-color:rgb(255,255,255)">
<span style="font-size:18px; color:#330033"><u><em><strong>MGLShape&#43;PolygonParamer.h</strong></em></u></span></p>
<pre name="code" class="objc">//
//  MGLShape+PolygonParamer.m
//  Etoury
//
//  Created by dev on 2018/1/3.
//  Copyright &copy; 2018年 iron. All rights reserved.
//

#import &quot;MGLShape+PolygonParamer.h&quot;
#import &lt;objc/runtime.h&gt;


static UIColor *_fillColor;//填充颜色
static NSInteger _fillOpacity;//填充透明度
static UIColor *_strokeColor;//描边颜色
static BOOL _isDash;//YES = 虚线／NO = 实线
static NSInteger _strokeWeight;//描边宽度



@implementation MGLShape (PolygonParamer)


- (void)setFillColor:(UIColor *)fillColor {
    objc_setAssociatedObject(self, &amp;_fillColor, fillColor, OBJC_ASSOCIATION_COPY);
}
- (UIColor *)fillColor {
    return objc_getAssociatedObject(self, &amp;_fillColor);
}


- (void)setFillOpacity:(CGFloat)fillOpacity {
    NSNumber *fillOpacityNumber = @(fillOpacity);
    objc_setAssociatedObject(self, &amp;_fillOpacity, fillOpacityNumber, OBJC_ASSOCIATION_COPY);
}
- (CGFloat)fillOpacity {
    NSNumber *fillOpacityNumber = objc_getAssociatedObject(self, &amp;_fillOpacity);
    return [fillOpacityNumber floatValue];
}


- (void)setStrokeColor:(UIColor *)strokeColor {
    objc_setAssociatedObject(self, &amp;_strokeColor, strokeColor, OBJC_ASSOCIATION_COPY);
}
- (UIColor *)strokeColor {
    return objc_getAssociatedObject(self, &amp;_strokeColor);
}


- (void)setIsDash:(BOOL)isDash {
    NSNumber *isDashNumber = [NSNumber numberWithBool:isDash];
    objc_setAssociatedObject(self, &amp;_isDash, isDashNumber, OBJC_ASSOCIATION_COPY);
}
- (BOOL)isDash {
    NSNumber *isDashNumber = objc_getAssociatedObject(self, &amp;_isDash);
    return [isDashNumber boolValue];
}


- (void)setStrokeWeight:(NSInteger)strokeWeight {
    NSNumber *strokeWeightNumber = @(strokeWeight);
    objc_setAssociatedObject(self, &amp;_strokeWeight, strokeWeightNumber, OBJC_ASSOCIATION_COPY);
}
- (NSInteger)strokeWeight {
    NSNumber *strokeWeightNumber = objc_getAssociatedObject(self, &amp;_strokeWeight);
    return [strokeWeightNumber integerValue];
}




@end
</pre><br>
把&nbsp;<span style="font-family:Menlo; background-color:rgb(255,255,255)"><span style="font-size:18px; color:#6600cc">MGLShape&#43;PolygonParamer</span><span style="font-size:18px; color:#330033">引入到 view controller 中：</span></span></div>
<div style="text-align:justify"><span style="font-family:Menlo; font-size:18px; color:#330033"><span style="background-color:rgb(255,255,255)"></span></span><pre name="code" class="objc">//
//  LinePolygonMapboxViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright &copy; 2018年 wangzhengang. All rights reserved.
//

#import &quot;LinePolygonMapboxViewController.h&quot;
#import &lt;Mapbox/Mapbox.h&gt;
#import &quot;MGLShape+PolygonParamer.h&quot;


@interface LinePolygonMapboxViewController ()&lt;MGLMapViewDelegate&gt;
@property (nonatomic, strong) MGLMapView *mapView;

@property (nonatomic, strong) MGLPolyline *blueLine;//蓝色线段

@property (nonatomic, strong) MGLPolyline *strokeLine;//多边形边线
@property (nonatomic, strong) MGLPolygon *polygon;//多边形

@end

@implementation LinePolygonMapboxViewController

- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @&quot;线段和多边形&quot;;
    
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@&quot;mapbox://styles/mapbox/streets-v10&quot;]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:8 animated:YES];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeNone;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}


- (MGLPolyline *)blueLine {
    if (_blueLine == nil) {
        CLLocationCoordinate2D coords[3];
        coords[0] = CLLocationCoordinate2DMake(27.000, 95.356745);
        coords[1] = CLLocationCoordinate2DMake(20.000, 105.356745);
        coords[2] = CLLocationCoordinate2DMake(27.000, 115.356745);
        
        _blueLine = [MGLPolyline polylineWithCoordinates:coords count:3];
        _blueLine.strokeColor   = [UIColor blueColor];
        _blueLine.strokeWeight  = 3.f;
        _blueLine.fillOpacity   = 0.75f;
        _blueLine.isDash        = NO;
    }
    return _blueLine;
}

- (MGLPolyline *)strokeLine {
    if (_strokeLine == nil) {
        CLLocationCoordinate2D coords[6];
        coords[0] = CLLocationCoordinate2DMake(30.980528, 110.306745);
        coords[2] = CLLocationCoordinate2DMake(30.000, 120.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 120.306745);
        coords[3] = CLLocationCoordinate2DMake(40.000, 110.306745);
        coords[4] = CLLocationCoordinate2DMake(35.000, 95.356745);
        coords[5] = CLLocationCoordinate2DMake(30.980528, 110.306745);;
        _strokeLine = [MGLPolyline polylineWithCoordinates:coords count:6];
        _strokeLine.strokeColor   = [UIColor blackColor];
        _strokeLine.strokeWeight  = 2.f;
        _strokeLine.fillOpacity   = 0.75f;
        _strokeLine.isDash        = YES;
    }
    return _strokeLine;
}

- (MGLPolygon *)polygon {
    if (_polygon == nil) {
        CLLocationCoordinate2D coords[6];
        coords[0] = CLLocationCoordinate2DMake(30.980528, 110.306745);
        coords[2] = CLLocationCoordinate2DMake(30.000, 120.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 120.306745);
        coords[3] = CLLocationCoordinate2DMake(40.000, 110.306745);
        coords[4] = CLLocationCoordinate2DMake(35.000, 95.356745);
        _polygon = [MGLPolygon polygonWithCoordinates:coords count:5];
        _polygon.fillColor   = [UIColor redColor];
        _polygon.strokeColor = [UIColor blueColor];
        _polygon.strokeWeight= 2.f;
        _polygon.fillOpacity = 0.5f;
    }
    return _polygon;
}

#pragma mark MGLMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView {
    ///地图加载完成后绘制 线段 和 多边形
    [mapView addOverlays:@[self.blueLine, self.strokeLine, self.polygon]];
    ///把窗口显示到合适的范围
    [mapView setVisibleCoordinateBounds:self.polygon.overlayBounds edgePadding:UIEdgeInsetsMake(0, 10, 200, 10) animated:YES];
    
//    [mapView setVisibleCoordinateBounds:self.line.overlayBounds edgePadding:UIEdgeInsetsMake(300, 10, 0, 10) animated:YES];
}

- (CGFloat)mapView:(MGLMapView *)mapView alphaForShapeAnnotation:(MGLShape *)annotation {
    ///MGLPolyline 和 MGLPolygon 都执行这个方法
    return annotation.fillOpacity;
}

- (UIColor *)mapView:(MGLMapView *)mapView strokeColorForShapeAnnotation:(MGLShape *)annotation {
    ///MGLPolyline 和 MGLPolygon 都执行这个方法
    if ([@&quot;MGLPolyline&quot; isEqualToString:NSStringFromClass([annotation class])]) {
        
        if (annotation.isDash) {
            MGLShapeSource *shapeSource = [self addSourceWithShape:annotation];
            [self.mapView.style addSource:shapeSource];
            MGLStyleLayer *styleLayer = [self dashedLineWithStyle:shapeSource shape:annotation lineDashPattern:@[@2.f, @1.f] lineCap:MGLLineCapButt lineColor:[UIColor blackColor] lineWidth:@2];
            [self.mapView.style addLayer:styleLayer];
            return [UIColor clearColor];
        } else {
            return annotation.strokeColor;
        }
    } else if ([@&quot;MGLPolygon&quot; isEqualToString:NSStringFromClass([annotation class])]) {
        
        return annotation.strokeColor;
    }
    return annotation.strokeColor;
}

- (UIColor *)mapView:(MGLMapView *)mapView fillColorForPolygonAnnotation:(MGLPolygon *)annotation {
    /// MGLPolygon 执行这个方法， MGLPolyline 不执行这个方法
    return annotation.fillColor;
}

- (CGFloat)mapView:(MGLMapView *)mapView lineWidthForPolylineAnnotation:(MGLPolyline *)annotation {
    ///MGLPolyline 执行这个方法, MGLPolygon 不执行
    return annotation.strokeWeight;
}

#pragma mark 画虚线
- (MGLShapeSource *)addSourceWithShape:(MGLShape *)shape {
    return [[MGLShapeSource alloc] initWithIdentifier:@&quot;DashLines&quot; shape:shape options:nil];
}

- (MGLStyleLayer *)dashedLineWithStyle:(MGLShapeSource *)shapeSource shape:(MGLShape *)shape lineDashPattern:(NSArray&lt;NSNumber *&gt; *)lineDashPattern lineCap:(MGLLineCap)cap lineColor:(UIColor *)lineColor lineWidth:(NSNumber *)lineWidth {
    MGLLineStyleLayer *lineStyleLayer = [[MGLLineStyleLayer alloc] initWithIdentifier:@&quot;DashLines&quot; source:shapeSource];
    //线段模型
    lineStyleLayer.lineDashPattern = [MGLStyleValue valueWithRawValue:lineDashPattern];
    //线段头部
    lineStyleLayer.lineCap   = [MGLStyleValue valueWithRawValue:[NSNumber numberWithInteger:cap]];
    //线段颜色
    lineStyleLayer.lineColor = [MGLStyleValue valueWithRawValue:lineColor];
    //线段宽度
    lineStyleLayer.lineWidth = [MGLStyleValue valueWithRawValue:lineWidth];
    return lineStyleLayer;
}





@end
</pre>整个代码的是用步骤是这样的：</div>
<div style="text-align:justify">
<ul>
<li><span style="font-family:Menlo; color:#330033"><span style="background-color:rgb(255,255,255)">实现&nbsp;</span></span><span style="color:rgb(0,0,0); font-family:Menlo; background-color:rgb(255,255,255)">MGLShape (PolygonParamer) 扩展类&nbsp;</span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; background-color:rgb(255,255,255)">MGLShape&#43;PolygonParamer
 ；</span></li><li><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)"><span style="color:#000000">把&nbsp;</span></span></span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; background-color:rgb(255,255,255)">MGLShape&#43;PolygonParamer.h
 引入到 &nbsp;</span><span style="color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; background-color:rgb(255,255,255)">LinePolygonMapboxViewController.h 这个 view controller 中；</span></li><li><span style="font-size:18px; color:rgb(69,69,69); font-family:&quot;Helvetica Neue&quot;; background-color:rgb(255,255,255)">运行看效果；</span></li></ul>
</div>
<div style="text-align:justify"><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)"><span style="color:#000000"><span style="font-size:11px"><img src="http://img.blog.csdn.net/20180131112837081?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="500" height="900" alt=""><br>
</span></span></span></span><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)"><span style="color:#000000"><span style="font-size:11px"><br>
<br>
</span></span><br>
</span></span>
<h1><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)">三、后续更新：</span></span></h1>
</div>
<div style="text-align:justify"><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)">现在文章到这里只是讲述了 Mapbox 的常规使用，后续我会更新关于 多点聚合、位置方向等的使用。。。</span></span></div>
<div style="text-align:justify"><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)"><br>
</span></span></div>
<div style="text-align:justify">
<h1><span style="font-family:Menlo"><span style="background-color:rgb(255,255,255)">四、和其他地图的对比：</span></span></h1>
<p style="margin-bottom:0px; font-size:11px; line-height:normal; font-family:Menlo; color:rgb(0,143,0); background-color:rgb(255,255,255)">
<img src="http://img.blog.csdn.net/20180131131845504?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhlbmdhbmcwMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width="1200" height="200" alt=""><br>
</p>
<p style="margin-bottom:0px; font-size:11px; line-height:normal; font-family:Menlo; color:rgb(0,143,0); background-color:rgb(255,255,255)">
<br>
</p>
<p style="margin-bottom:0px; font-size:11px; line-height:normal; font-family:Menlo; color:rgb(0,143,0); background-color:rgb(255,255,255)">
<br>
</p>
<h1>五、博客地址：</h1>
</div>
<h1></h1>
<div style="color:rgb(69,69,69)"><span style="font-size:18px; font-weight:normal"><span style="color:rgb(79,79,79); font-size:18px; text-align:justify">博客地址：<a target="_blank" target="_blank" href="https://github.com/wangzhengang/MapboxExample/">http://blog.csdn.net/zhengang007/article/details/79170558</a>&nbsp;&nbsp;</span></div>
<div style="color:rgb(69,69,69)"><span style="font-size:18px"><span style="font-weight:normal">如果您觉得对您有用，请点个赞。</span></span></div>
</div>
<div style="color:rgb(69,69,69)"><span style="font-size:18px"><span style="font-weight:normal"><br>
</span></span></div>
<div style="color:rgb(69,69,69)"><span style="font-size:18px"><span style="font-weight:normal"><br>
</span></span></div>
   
</div>

