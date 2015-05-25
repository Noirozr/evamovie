//
//  mainViewController.m
//  eva movie
//
//  Created by Yongjia Liu on 5/11/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "mainViewController.h"
#import "webViewController.h"
#import "PulsingHaloLayer.h"
#import "Animator.h"

#define VisiblePosition CGPointMake(width/2+220, 90)
#define VisibleReadyPosition CGPointMake(width/2-20,90)
#define HiddenPosition CGPointMake(width/2-20,90)


@interface mainViewController ()<UIViewControllerTransitioningDelegate>
{
    UIColor *evil;
    UIColor *pure;
    UIColor *white;
    UIColor *light;
    UIColor *joColor;
    UIColor *haColor;
    UIColor *kyuColor;
    UIColor *midNight;
    UIColor *malibu;
    float width;
    float height;
    UIImageView *posterOfJo;
    BOOL posterOfJoiseven;
    BOOL alertiseven;
    UIView *alert;
    UIButton *link;
    UIButton *character;
    UIButton *eva;
    UIButton *angel;
    UIScrollView *linkScrollView;
    UIScrollView *characterScrollView;
    UIScrollView *evaScrollView;
    UIScrollView *angelScrollView;
    UIView *transfer;
}
@property (nonatomic,strong)Animator *animator;
@property (nonatomic, strong) PulsingHaloLayer *halo;
@end

@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _animator=[Animator new];
    pure=[UIColor colorWithRed:0.93 green:0.93 blue:0.92 alpha:1];
    //evil=[UIColor colorWithRed:0.14 green:0.08 blue:0.05 alpha:1];
    evil=[UIColor blackColor];
    white=[UIColor whiteColor];
    light=[UIColor colorWithRed:0.75 green:0.76 blue:0.73 alpha:1];
    joColor=[UIColor colorWithRed:0.93 green:0.93 blue:0.92 alpha:1];;
    haColor=[UIColor colorWithRed:0.89 green:0.49 blue:0.1 alpha:1];
    kyuColor=[UIColor colorWithRed:0.1 green:0.65 blue:0.74 alpha:1];
    midNight=[UIColor colorWithRed:0.1 green:0.09 blue:0.28 alpha:1];
    malibu=[UIColor colorWithRed:0.36 green:0.7 blue:0.86 alpha:1];
    width=self.view.frame.size.width;
    height=self.view.frame.size.height;
    posterOfJoiseven=YES;
    alertiseven=YES;
    [self.view setBackgroundColor:pure];
    
    //
    //
    //    UIScrollView *Jo=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 416, width-60, height-416)];
    //    [Jo setBackgroundColor:pure];
    //    [Jo setShowsVerticalScrollIndicator:NO];
    //    [Jo setContentSize:CGSizeMake(width, height*2)];
    //    [self.view addSubview:Jo];
    UIImageView *bgimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    bgimage.image=[UIImage imageNamed:@"Rebuild_of_Evangelion_1.0_Poster.png"];
    bgimage.alpha=0.3;
    [self.view addSubview:bgimage];
    
    UILabel *titleOfJo=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, width, 40)];
    titleOfJo.text=@"Evangelion: 1.0 You Are (Not) Alone";
    titleOfJo.font=[UIFont fontWithName:@"Avenir" size:30];
    titleOfJo.textAlignment=NSTextAlignmentCenter;
    titleOfJo.textColor=evil;
    [self.view addSubview:titleOfJo];
    
    UIButton *toLoad = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toLoad.frame = CGRectMake(width/2-80,70, 40.0, 40.0);
    //[toKyu setTitle:@"Q" forState:UIControlStateNormal];
    toLoad.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [toLoad setTitleColor:evil forState:UIControlStateNormal];
    [toLoad setBackgroundColor:evil];
    [toLoad addTarget:self action:@selector(buttonClickedLoad:) forControlEvents:UIControlEventTouchUpInside];
    toLoad.layer.cornerRadius=20;
    toLoad.layer.masksToBounds=YES;
    [self.view addSubview:toLoad];
    
    UIButton *toJo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toJo.frame = CGRectMake(width/2-40,70, 40.0, 40.0);
    //[toKyu setTitle:@"Q" forState:UIControlStateNormal];
    toJo.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [toJo setTitleColor:evil forState:UIControlStateNormal];
    [toJo setBackgroundColor:joColor];
    [toJo addTarget:self action:@selector(buttonClickedJo:) forControlEvents:UIControlEventTouchUpInside];
    toJo.layer.cornerRadius=20;
    toJo.layer.masksToBounds=YES;
    [self.view addSubview:toJo];
    
    self.halo = [PulsingHaloLayer layer];
    self.halo.position = toJo.center;
    [self.view.layer insertSublayer:self.halo below:toLoad.layer];
    
    alert=[[UIView alloc]initWithFrame:CGRectMake(275, 60, 240, 80)];
    alert.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    alert.layer.position = HiddenPosition;
    alert.layer.opacity = 0.0f;
    alert.layer.cornerRadius = 4.0f;
    [alert setBackgroundColor:[UIColor colorWithRed:0.1 green:0.09 blue:0.28 alpha:1]];
    [self.view addSubview:alert];
    UILabel *clicktoEnter=[[UILabel alloc]initWithFrame:alert.bounds];
    clicktoEnter.text=@"Tap buttons to switch";
    clicktoEnter.font=[UIFont fontWithName:@"Avenir" size:24];
    clicktoEnter.textAlignment=NSTextAlignmentCenter;
    clicktoEnter.textColor=pure;
    [alert addSubview:clicktoEnter];
    
    UIButton *toHa = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toHa.frame = CGRectMake(width/2,70, 40.0, 40.0);
    //[toKyu setTitle:@"Q" forState:UIControlStateNormal];
    toHa.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [toHa setTitleColor:evil forState:UIControlStateNormal];
    [toHa setBackgroundColor:haColor];
    [toHa addTarget:self action:@selector(buttonClickedHa:) forControlEvents:UIControlEventTouchUpInside];
    toHa.layer.cornerRadius=20;
    toHa.layer.masksToBounds=YES;
    [self.view addSubview:toHa];
    //
    UIButton *toKyu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toKyu.frame = CGRectMake(width/2+40,70, 40.0, 40.0);
    //[toKyu setTitle:@"Q" forState:UIControlStateNormal];
    toKyu.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [toKyu setTitleColor:evil forState:UIControlStateNormal];
    [toKyu setBackgroundColor:kyuColor];
    [toKyu addTarget:self action:@selector(buttonClickedKyu:) forControlEvents:UIControlEventTouchUpInside];
    toKyu.layer.cornerRadius=20;
    toKyu.layer.masksToBounds=YES;
    [self.view addSubview:toKyu];
#pragma mark posterOfJo
    posterOfJo=[[UIImageView alloc]initWithFrame:CGRectMake(30,120, 200, 286.5)];
    posterOfJo.image=[UIImage imageNamed:@"Rebuild_of_Evangelion_1.0_Poster.png"];
    [posterOfJo setBackgroundColor:[UIColor clearColor]];
    posterOfJo.userInteractionEnabled=YES;
    [self.view addSubview:posterOfJo];
    
    UILabel *introduction=[[UILabel alloc]initWithFrame:CGRectMake(260, 120, width-270, 286.5)];
    introduction.font=[UIFont fontWithName:@"Avenir" size:20];
    introduction.text=@"导演:庵野秀明、摩砂雪、鹤卷和哉\n监制:庵野秀明\n编剧:庵野秀明\n主演:緒方惠美、林原惠、三石琴乃、關智一\n配乐作曲:鷺巣詩郎\n剪辑:奧田浩史\n制片商:Studio Khara\n发行商:KlockWorx、Khara\n片长:98min\n上映日期:2007年9月1日";
    introduction.lineBreakMode=NSLineBreakByWordWrapping;
    introduction.numberOfLines=0;
    //[self.view addSubview:introduction];
    [self.view insertSubview:introduction belowSubview:posterOfJo];
    
    UITapGestureRecognizer *posterOfJoTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClicked:)];
    [posterOfJo addGestureRecognizer:posterOfJoTap];
    
    link=[[UIButton alloc]initWithFrame:CGRectMake(30, 430, width/5, 40)];
    [link setTitle:@"相关链接" forState:UIControlStateNormal];
    [link setTitleColor:white forState:UIControlStateNormal];
    [link setBackgroundColor:evil];
    link.alpha=0.9;
    [link addTarget:self action:@selector(touchLinkButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:link belowSubview:posterOfJo];
    
    character=[[UIButton alloc]initWithFrame:CGRectMake(30+width/5, 430, width/5, 40)];
    [character setTitle:@"登场角色" forState:UIControlStateNormal];
    [character setTitleColor:evil forState:UIControlStateNormal];
    [character setBackgroundColor:white];
    character.alpha=0.7;
    character.layer.borderColor=[evil CGColor];
    
    [character addTarget:self action:@selector(touchCharacterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:character belowSubview:posterOfJo];
    
    eva=[[UIButton alloc]initWithFrame:CGRectMake(30+2*width/5, 430, width/5, 40)];
    [eva setTitle:@"EVA" forState:UIControlStateNormal];
    [eva setTitleColor:evil forState:UIControlStateNormal];
    [eva setBackgroundColor:white];
    eva.alpha=0.7;
    [eva addTarget:self action:@selector(touchEVAButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:eva belowSubview:posterOfJo];
    
    angel=[[UIButton alloc]initWithFrame:CGRectMake(30+3*width/5, 430, width/5, 40)];
    [angel setTitle:@"使徒" forState:UIControlStateNormal];
    [angel setTitleColor:evil forState:UIControlStateNormal];
    [angel setBackgroundColor:white];
    angel.alpha=0.7;
    [angel addTarget:self action:@selector(touchAngelButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:angel belowSubview:posterOfJo];
    
    linkScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    linkScrollView.tag=1;
    [linkScrollView setBackgroundColor:[UIColor clearColor]];
    UIView *maskOfLink=[[UIView alloc]initWithFrame:linkScrollView.bounds];
    [maskOfLink setBackgroundColor:evil];
    maskOfLink.alpha=0.7;
    [linkScrollView addSubview:maskOfLink];
    [self.view insertSubview:linkScrollView aboveSubview:posterOfJo];
#pragma mark link
    UILabel *resourceOfLink=[[UILabel alloc]initWithFrame:CGRectMake(30, 30, 300, 250)];
    resourceOfLink.font=[UIFont fontWithName:@"Avenir" size:30];
    resourceOfLink.text=@"维基百科:\n百度百科:\n第三新东京市(CN):\nWikia Evangelion:\nevangelion.co.jp:";
    resourceOfLink.lineBreakMode=NSLineBreakByCharWrapping;
    resourceOfLink.numberOfLines=0;
    resourceOfLink.textColor=white;
    [linkScrollView addSubview:resourceOfLink];
    UILabel *wikiCN=[[UILabel alloc]initWithFrame:CGRectMake(170, 50, 100, 50)];
    wikiCN.text=@"中文";
    wikiCN.font=[UIFont fontWithName:@"Avenir" size:30];
    wikiCN.userInteractionEnabled=YES;
    wikiCN.textColor=malibu;
    [linkScrollView addSubview:wikiCN];
    UITapGestureRecognizer *wikiCNTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wikiCNTap)];
    [wikiCN addGestureRecognizer:wikiCNTap];
    UILabel *wikiEN=[[UILabel alloc]initWithFrame:CGRectMake(250, 50, 100, 50)];
    wikiEN.text=@"英文";
    wikiEN.font=[UIFont fontWithName:@"Avenir" size:30];
    wikiEN.userInteractionEnabled=YES;
    wikiEN.textColor=malibu;
    [linkScrollView addSubview:wikiEN];
    UITapGestureRecognizer *wikiENTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wikiENTap)];
    [wikiEN addGestureRecognizer:wikiENTap];
    UILabel *wikiJP=[[UILabel alloc]initWithFrame:CGRectMake(330, 50, 100, 50)];
    wikiJP.text=@"日文";
    wikiJP.font=[UIFont fontWithName:@"Avenir" size:30];
    wikiJP.userInteractionEnabled=YES;
    wikiJP.textColor=malibu;
    [linkScrollView addSubview:wikiJP];
    UITapGestureRecognizer *wikiJPTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wikiJPTap)];
    [wikiJP addGestureRecognizer:wikiJPTap];
    UILabel *Baike=[[UILabel alloc]initWithFrame:CGRectMake(170, 90, 400, 50)];
    Baike.text=@"新世纪福音战士新剧场版:序";
    Baike.font=[UIFont fontWithName:@"Avenir" size:30];
    Baike.userInteractionEnabled=YES;
    Baike.textColor=malibu;
    [linkScrollView addSubview:Baike];
    UITapGestureRecognizer *BaikeTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(baikeTap)];
    [Baike addGestureRecognizer:BaikeTap];
    UILabel *tokyo3=[[UILabel alloc]initWithFrame:CGRectMake(290, 130, 400, 50)];
    tokyo3.text=@"EVA中国论坛";
    tokyo3.font=[UIFont fontWithName:@"Avenir" size:30];
    tokyo3.userInteractionEnabled=YES;
    tokyo3.textColor=malibu;
    [linkScrollView addSubview:tokyo3];
    UITapGestureRecognizer *tokyo3Tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tokyo3Tap)];
    [tokyo3 addGestureRecognizer:tokyo3Tap];
    UILabel *wikia=[[UILabel alloc]initWithFrame:CGRectMake(270, 170, 400, 50)];
    wikia.text=@" You Are (Not) Alone";
    wikia.font=[UIFont fontWithName:@"Avenir" size:30];
    wikia.userInteractionEnabled=YES;
    wikia.textColor=malibu;
    [linkScrollView addSubview:wikia];
    UITapGestureRecognizer *wikiaTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wikiaTap)];
    [wikia addGestureRecognizer:wikiaTap];
    UILabel *evangelionCo=[[UILabel alloc]initWithFrame:CGRectMake(260, 215, 400, 50)];
    evangelionCo.text=@" ヱヴァンゲリヲン新劇場版:序";
    evangelionCo.font=[UIFont fontWithName:@"Avenir" size:28];
    evangelionCo.userInteractionEnabled=YES;
    evangelionCo.textColor=malibu;
    [linkScrollView addSubview:evangelionCo];
    UITapGestureRecognizer *evangelionCoTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(evangelionCoTap)];
    [evangelionCo addGestureRecognizer:evangelionCoTap];
    
    characterScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    characterScrollView.tag=0;
    characterScrollView.alpha=0;
    [characterScrollView setBackgroundColor:[UIColor clearColor]];
    [characterScrollView setContentSize:CGSizeMake(8*width/5, 500)];
    [characterScrollView setShowsHorizontalScrollIndicator:NO];
    UIView *maskOfCharacter=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 8*width/5, 500)];
    [maskOfCharacter setBackgroundColor:evil];
    maskOfCharacter.alpha=0.7;
    [characterScrollView addSubview:maskOfCharacter];
    [self.view insertSubview:characterScrollView aboveSubview:posterOfJo];
    
    UIView *shinji=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 170, 500)];
    UIImageView *shinjiImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    shinjiImage.image=[UIImage imageNamed:@"Shinji_Ikari.png"];
    [shinji addSubview:shinjiImage];
    UILabel *shinjiLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    shinjiLabel.text=@"碇真嗣";
    shinjiLabel.textColor=white;
    shinjiLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [shinji addSubview:shinjiLabel];
    [characterScrollView addSubview:shinji];
    
    UIView *rei=[[UIView alloc]initWithFrame:CGRectMake(250, 30, 170, 500)];
    UIImageView *reiImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 400)];
    reiImage.image=[UIImage imageNamed:@"Rei_Ayanami.png"];
    [rei addSubview:reiImage];
    UILabel *reiLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 130, 40)];
    reiLabel.text=@"绫波丽";
    reiLabel.textColor=white;
    reiLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [rei addSubview:reiLabel];
    [characterScrollView addSubview:rei];
    
    UIView *Misato=[[UIView alloc]initWithFrame:CGRectMake(460, 30, 170, 500)];
    UIImageView *misatoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    misatoImage.image=[UIImage imageNamed:@"Misato_Katsuragi.png"];
    [Misato addSubview:misatoImage];
    UILabel *misatoLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 170, 40)];
    misatoLabel.text=@"葛城美里";
    misatoLabel.textColor=white;
    misatoLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [Misato addSubview:misatoLabel];
    [characterScrollView addSubview:Misato];
    
    UIView *gendo=[[UIView alloc]initWithFrame:CGRectMake(670, 30, 170, 500)];
    UIImageView *gendoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    gendoImage.image=[UIImage imageNamed:@"Gendo_Ikari.png"];
    [gendo addSubview:gendoImage];
    UILabel *gendoLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 170, 40)];
    gendoLabel.text=@"碇源渡";
    gendoLabel.textColor=white;
    gendoLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [gendo addSubview:gendoLabel];
    [characterScrollView addSubview:gendo];

    
    evaScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    evaScrollView.tag=0;
    evaScrollView.alpha=0;
    [evaScrollView setBackgroundColor:[UIColor clearColor]];
    UIView *maskOfEva=[[UIView alloc]initWithFrame:linkScrollView.bounds];
    [maskOfEva setBackgroundColor:evil];
    maskOfEva.alpha=0.7;
    [evaScrollView addSubview:maskOfEva];
    [self.view insertSubview:evaScrollView aboveSubview:posterOfJo];
    UIView *eva01=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 130, 430)];
    UIImageView *evaImage01=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 390)];
    evaImage01.image=[UIImage imageNamed:@"Eva01RenderLight.png"];
    [eva01 addSubview:evaImage01];
    UILabel *evaLabel01=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    evaLabel01.text=@"初号机";
    evaLabel01.textColor=white;
    evaLabel01.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva01 addSubview:evaLabel01];
    [evaScrollView addSubview:eva01];
    UIView *eva00=[[UIView alloc]initWithFrame:CGRectMake(300, 30, 130, 430)];
    UIImageView *evaImage00=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 390)];
    evaImage00.image=[UIImage imageNamed:@"Evangelion_Unit_00'_(Rebuild).png"];
    [eva00 addSubview:evaImage00];
    UILabel *evaLabel00=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    evaLabel00.text=@"零号机";
    evaLabel00.textColor=white;
    evaLabel00.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva00 addSubview:evaLabel00];
    [evaScrollView addSubview:eva00];
    angelScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    angelScrollView.tag=0;
    angelScrollView.alpha=0;
    [angelScrollView setBackgroundColor:[UIColor clearColor]];
    [angelScrollView setShowsHorizontalScrollIndicator:NO];
    [angelScrollView setContentSize:CGSizeMake(width/5*8, 500)];
    UIView *maskOfAngel=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width/5*8, 500)];
    [maskOfAngel setBackgroundColor:evil];
    maskOfAngel.alpha=0.7;
    [angelScrollView addSubview:maskOfAngel];
    [self.view insertSubview:angelScrollView aboveSubview:posterOfJo];
    
    UIView *angel4=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 300, 400)];
    UIImageView *angelImage4=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    angelImage4.image=[UIImage imageNamed:@"Sachiel.png"];
    [angel4 addSubview:angelImage4];
    UILabel *angelLabel4=[[UILabel alloc]initWithFrame:CGRectMake(0, 410, 300, 40)];
    angelLabel4.text=@"第四使徒";
    angelLabel4.textColor=white;
    angelLabel4.textAlignment=NSTextAlignmentCenter;
    angelLabel4.font=[UIFont fontWithName:@"Avenir" size:40];
    [angel4 addSubview:angelLabel4];
    [angelScrollView addSubview:angel4];
    UIView *angel5=[[UIView alloc]initWithFrame:CGRectMake(350, 30, 300, 400)];
    UIImageView *angelImage5=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    angelImage5.image=[UIImage imageNamed:@"5th_Angel_Render.png"];
    [angel5 addSubview:angelImage5];
    UILabel *angelLabel5=[[UILabel alloc]initWithFrame:CGRectMake(0, 410, 300, 40)];
    angelLabel5.text=@"第五使徒";
    angelLabel5.textColor=white;
    angelLabel5.textAlignment=NSTextAlignmentCenter;
    angelLabel5.font=[UIFont fontWithName:@"Avenir" size:40];
    [angel5 addSubview:angelLabel5];
    [angelScrollView addSubview:angel5];
    UIView *angel6=[[UIView alloc]initWithFrame:CGRectMake(680, 30, 400, 400)];
    UIImageView *angelImage6=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    angelImage6.image=[UIImage imageNamed:@"The_Sixth_Angel_(Rebuild).png"];
    [angel6 addSubview:angelImage6];
    UILabel *angelLabel6=[[UILabel alloc]initWithFrame:CGRectMake(0, 410, 400, 40)];
    angelLabel6.text=@"第六使徒";
    angelLabel6.textColor=white;
    angelLabel6.textAlignment=NSTextAlignmentCenter;
    angelLabel6.font=[UIFont fontWithName:@"Avenir" size:40];
    [angel6 addSubview:angelLabel6];
    [angelScrollView addSubview:angel6];
    
}
#pragma mark buttonClicked
-(void) buttonClicked:(id)sender
{
    if (posterOfJoiseven) {
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(200,286.5)];
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(width/2, height/2)];
        [posterOfJo.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(3.0f, 3.0f)];
        scaleAnimation.springBounciness = 15.0f;
        scaleAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfJo.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        posterOfJoiseven=!posterOfJoiseven;
    }else{
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(3.0f, 3.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.springBounciness = 10.0f;
        //scaleAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfJo.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(width/2, height/2)];
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(130, 263.25)];
        positionAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfJo.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        posterOfJoiseven=!posterOfJoiseven;
    }
    
}
-(void) buttonClickedLoad:(id)sender
{
    if ([self.presentingViewController isKindOfClass:[loadViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        loadViewController *lvc=[[loadViewController alloc]init];
        lvc.transitioningDelegate=self;
        [self presentViewController:lvc animated:YES completion:nil];
    }
}
-(void) buttonClickedJo:(id)sender
{
    if (alertiseven) {
        alertiseven=!alertiseven;
        POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation.fromValue = @(0);
        opacityAnimation.toValue = @(1);
        opacityAnimation.beginTime = CACurrentMediaTime() + 0.1;
        [alert.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:VisibleReadyPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:VisiblePosition];
        [alert.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];//@(0.0f);
        scaleAnimation.springBounciness = 20.0f;
        scaleAnimation.springSpeed = 20.0f;
        [alert.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }else{
        alertiseven=!alertiseven;
        POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation.fromValue = @(1);
        opacityAnimation.toValue = @(0);
        [alert.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:VisiblePosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:HiddenPosition];
        [alert.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
        [alert.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
    //[self presentViewController:lvc animated:YES completion:nil];
}
-(void) buttonClickedHa:(id)sender
{
    if ([self.presentingViewController isKindOfClass:[secondViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        secondViewController *svc=[[secondViewController alloc]init];
        svc.transitioningDelegate=self;
        [self presentViewController:svc animated:YES completion:nil];
    }
    
}
-(void) buttonClickedKyu:(id)sender
{
    if ([self.presentingViewController isKindOfClass:[thirdViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        thirdViewController *tvc=[[thirdViewController alloc]init];
        tvc.transitioningDelegate=self;
        [self presentViewController:tvc animated:YES completion:nil];
    }
    
}
-(void)touchLinkButton
{
    if (CGColorEqualToColor([link.backgroundColor CGColor], [white CGColor])) {
        link.backgroundColor=evil;
        [link setTitleColor:white forState:UIControlStateNormal];
        link.alpha=0.9;
        character.backgroundColor=white;
         [character setTitleColor:evil forState:UIControlStateNormal];
        character.alpha=0.7;
        eva.backgroundColor=white;
        [eva setTitleColor:evil forState:UIControlStateNormal];
        eva.alpha=0.7;
        angel.backgroundColor=white;
        [angel setTitleColor:evil forState:UIControlStateNormal];
        angel.alpha=0.7;
        transfer=[self.view viewWithTag:1];
        POPBasicAnimation *opacityAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation1.fromValue = @(1);
        opacityAnimation1.toValue = @(0);
        [transfer.layer pop_addAnimation:opacityAnimation1 forKey:@"opacityAnimation"];
        CGPoint frompoint1=CGPointMake((width-60)/2+30, 730);
        CGPoint topoint1=CGPointMake((width-60)/2-50, 730);
        
        POPBasicAnimation *positionAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation1.fromValue = [NSValue valueWithCGPoint:frompoint1];
        positionAnimation1.toValue = [NSValue valueWithCGPoint:topoint1];
        [transfer.layer pop_addAnimation:positionAnimation1 forKey:@"positionAnimation"];
        
        POPBasicAnimation *opacityAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation2.fromValue = @(0);
        opacityAnimation2.toValue = @(1);
        opacityAnimation2.beginTime=CACurrentMediaTime()+0.4;
        [linkScrollView.layer pop_addAnimation:opacityAnimation2 forKey:@"opacityAnimation"];
        CGPoint frompoint2=CGPointMake((width-60)/2+80, 730);
        CGPoint topoint2=CGPointMake((width-60)/2+30, 730);
        
        POPBasicAnimation *positionAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation2.fromValue = [NSValue valueWithCGPoint:frompoint2];
        positionAnimation2.toValue = [NSValue valueWithCGPoint:topoint2];
        positionAnimation2.beginTime=CACurrentMediaTime()+0.3;
        [linkScrollView pop_addAnimation:positionAnimation2 forKey:@"positionAnimation"];
        
        transfer.tag=0;
        linkScrollView.tag=1;
    }
}
-(void)touchCharacterButton
{
    if (CGColorEqualToColor([character.backgroundColor CGColor], [white CGColor])) {
        character.backgroundColor=evil;
        [character setTitleColor:white forState:UIControlStateNormal];
        character.alpha=0.9;
        link.backgroundColor=white;
        [link setTitleColor:evil forState:UIControlStateNormal];
        link.alpha=0.7;
        eva.backgroundColor=white;
        [eva setTitleColor:evil forState:UIControlStateNormal];
        eva.alpha=0.7;
        angel.backgroundColor=white;
        [angel setTitleColor:evil forState:UIControlStateNormal];
        angel.alpha=0.7;
        transfer=[self.view viewWithTag:1];
        POPBasicAnimation *opacityAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation1.fromValue = @(1);
        opacityAnimation1.toValue = @(0);
        [transfer.layer pop_addAnimation:opacityAnimation1 forKey:@"opacityAnimation"];
        CGPoint frompoint1=CGPointMake((width-60)/2+30, 730);
        CGPoint topoint1=CGPointMake((width-60)/2-50, 730);
        
        POPBasicAnimation *positionAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation1.fromValue = [NSValue valueWithCGPoint:frompoint1];
        positionAnimation1.toValue = [NSValue valueWithCGPoint:topoint1];
        [transfer.layer pop_addAnimation:positionAnimation1 forKey:@"positionAnimation"];
        
        POPBasicAnimation *opacityAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation2.fromValue = @(0);
        opacityAnimation2.toValue = @(1);
        opacityAnimation2.beginTime=CACurrentMediaTime()+0.4;
        [characterScrollView.layer pop_addAnimation:opacityAnimation2 forKey:@"opacityAnimation"];
        CGPoint frompoint2=CGPointMake((width-60)/2+80, 730);
        CGPoint topoint2=CGPointMake((width-60)/2+30, 730);
        
        POPBasicAnimation *positionAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation2.fromValue = [NSValue valueWithCGPoint:frompoint2];
        positionAnimation2.toValue = [NSValue valueWithCGPoint:topoint2];
        positionAnimation2.beginTime=CACurrentMediaTime()+0.3;
        [characterScrollView pop_addAnimation:positionAnimation2 forKey:@"positionAnimation"];
        
        transfer.tag=0;
        characterScrollView.tag=1;
    }
}
-(void)touchEVAButton
{
    if (CGColorEqualToColor([eva.backgroundColor CGColor], [white CGColor])) {
        eva.backgroundColor=evil;
        [eva setTitleColor:white forState:UIControlStateNormal];
        eva.alpha=0.9;
        link.backgroundColor=white;
        [link setTitleColor:evil forState:UIControlStateNormal];
        link.alpha=0.7;
        character.backgroundColor=white;
         [character setTitleColor:evil forState:UIControlStateNormal];
        character.alpha=0.7;
        angel.backgroundColor=white;
        [angel setTitleColor:evil forState:UIControlStateNormal];
        angel.alpha=0.7;
        transfer=[self.view viewWithTag:1];
        POPBasicAnimation *opacityAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation1.fromValue = @(1);
        opacityAnimation1.toValue = @(0);
        [transfer.layer pop_addAnimation:opacityAnimation1 forKey:@"opacityAnimation"];
        CGPoint frompoint1=CGPointMake((width-60)/2+30, 730);
        CGPoint topoint1=CGPointMake((width-60)/2-50, 730);
        
        POPBasicAnimation *positionAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation1.fromValue = [NSValue valueWithCGPoint:frompoint1];
        positionAnimation1.toValue = [NSValue valueWithCGPoint:topoint1];
        [transfer.layer pop_addAnimation:positionAnimation1 forKey:@"positionAnimation"];
        
        POPBasicAnimation *opacityAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation2.fromValue = @(0);
        opacityAnimation2.toValue = @(1);
        opacityAnimation2.beginTime=CACurrentMediaTime()+0.4;
        [evaScrollView.layer pop_addAnimation:opacityAnimation2 forKey:@"opacityAnimation"];
        CGPoint frompoint2=CGPointMake((width-60)/2+80, 730);
        CGPoint topoint2=CGPointMake((width-60)/2+30, 730);
        
        POPBasicAnimation *positionAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation2.fromValue = [NSValue valueWithCGPoint:frompoint2];
        positionAnimation2.toValue = [NSValue valueWithCGPoint:topoint2];
        positionAnimation2.beginTime=CACurrentMediaTime()+0.3;
        [evaScrollView pop_addAnimation:positionAnimation2 forKey:@"positionAnimation"];
        
        transfer.tag=0;
        evaScrollView.tag=1;
    }
}
-(void)touchAngelButton
{
    if (CGColorEqualToColor([angel.backgroundColor CGColor], [white CGColor])) {
        angel.backgroundColor=evil;
        [angel setTitleColor:white forState:UIControlStateNormal];
        angel.alpha=0.9;
        link.backgroundColor=white;
        [link setTitleColor:evil forState:UIControlStateNormal];
        link.alpha=0.7;
        character.backgroundColor=white;
         [character setTitleColor:evil forState:UIControlStateNormal];
        character.alpha=0.7;
        eva.backgroundColor=white;
        [eva setTitleColor:evil forState:UIControlStateNormal];
        eva.alpha=0.7;
        
        transfer=[self.view viewWithTag:1];
        POPBasicAnimation *opacityAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation1.fromValue = @(1);
        opacityAnimation1.toValue = @(0);
        [transfer.layer pop_addAnimation:opacityAnimation1 forKey:@"opacityAnimation"];
        CGPoint frompoint1=CGPointMake((width-60)/2+30, 730);
        CGPoint topoint1=CGPointMake((width-60)/2-50, 730);
        
        POPBasicAnimation *positionAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation1.fromValue = [NSValue valueWithCGPoint:frompoint1];
        positionAnimation1.toValue = [NSValue valueWithCGPoint:topoint1];
        [transfer.layer pop_addAnimation:positionAnimation1 forKey:@"positionAnimation"];
        
        POPBasicAnimation *opacityAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation2.fromValue = @(0);
        opacityAnimation2.toValue = @(1);
        opacityAnimation2.beginTime=CACurrentMediaTime()+0.4;
        [angelScrollView.layer pop_addAnimation:opacityAnimation2 forKey:@"opacityAnimation"];
        CGPoint frompoint2=CGPointMake((width-60)/2+80, 730);
        CGPoint topoint2=CGPointMake((width-60)/2+30, 730);
        
        POPBasicAnimation *positionAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation2.fromValue = [NSValue valueWithCGPoint:frompoint2];
        positionAnimation2.toValue = [NSValue valueWithCGPoint:topoint2];
        positionAnimation2.beginTime=CACurrentMediaTime()+0.3;
        [angelScrollView pop_addAnimation:positionAnimation2 forKey:@"positionAnimation"];
        
        transfer.tag=0;
        angelScrollView.tag=1;
    }
}
-(void)wikiCNTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://zh.wikipedia.org/wiki/福音戰士新劇場版：序";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)wikiENTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://en.wikipedia.org/wiki/Evangelion:_1.0_You_Are_(Not)_Alone";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)wikiJPTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://ja.wikipedia.org/wiki/ヱヴァンゲリヲン新劇場版:序";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)baikeTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://baike.baidu.com/view/1553101.htm";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)tokyo3Tap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://www.tokyo3cn.com/bbs/forum.php";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)wikiaTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://evangelion.wikia.com/wiki/Evangelion:_1.0_You_Are_(Not)_Alone";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)evangelionCoTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://www.evangelion.co.jp/1_0/index.html";
    [self presentViewController:wvc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animator;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.animator;
}

//-(void)tapped
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
