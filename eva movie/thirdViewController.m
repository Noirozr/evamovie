//
//  thirdViewController.m
//  eva movie
//
//  Created by Yongjia Liu on 5/11/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "thirdViewController.h"
#import "webViewController.h"
#import "PulsingHaloLayer.h"
#import "Animator.h"

#define VisiblePosition CGPointMake(width/2+220, 90)
#define VisibleReadyPosition CGPointMake(width/2+60,90)
#define HiddenPosition CGPointMake(width/2+60,90)

@interface thirdViewController ()<UIViewControllerTransitioningDelegate>
{
    UIColor *evil;
    UIColor *pure;
    UIColor *white;
    UIColor *joColor;
    UIColor *haColor;
    UIColor *kyuColor;
    UIColor *malibu;
    float width;
    float height;
    UIView *alert;
    UIImageView *posterOfKyu;
    BOOL posterOfKyuiseven;
    BOOL alertiseven;
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

@implementation thirdViewController

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
    joColor=[UIColor colorWithRed:0.93 green:0.93 blue:0.92 alpha:1];;
    haColor=[UIColor colorWithRed:0.89 green:0.49 blue:0.1 alpha:1];
    kyuColor=[UIColor colorWithRed:0.1 green:0.65 blue:0.74 alpha:1];
    malibu=[UIColor colorWithRed:0.36 green:0.7 blue:0.86 alpha:1];
    width=self.view.frame.size.width;
    height=self.view.frame.size.height;
    posterOfKyuiseven=YES;
    alertiseven=YES;
    
    [self.view setBackgroundColor:kyuColor];
    
    UIImageView *bgimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    bgimage.image=[UIImage imageNamed:@"Kaworu_and_Shinji_Poster.png"];
    bgimage.alpha=0.3;
    [self.view addSubview:bgimage];
    
    UILabel *titleOfKyu=[[UILabel alloc]initWithFrame:CGRectMake(80, 20, width, 40)];
    titleOfKyu.text=@"Evangelion: 3.0 You Can (Not) Redo";
    titleOfKyu.font=[UIFont fontWithName:@"Avenir" size:30];
    titleOfKyu.textColor=evil;
    [self.view addSubview:titleOfKyu];
    
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
    
    self.halo = [PulsingHaloLayer layer];
    self.halo.position = toKyu.center;
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

    
    posterOfKyu=[[UIImageView alloc]initWithFrame:CGRectMake(30,120, 200, 286.5)];
    posterOfKyu.image=[UIImage imageNamed:@"Kaworu_and_Shinji_Poster.png"];
    [posterOfKyu setBackgroundColor:[UIColor clearColor]];
    posterOfKyu.userInteractionEnabled=YES;
    [self.view addSubview:posterOfKyu];
    
    UILabel *introduction=[[UILabel alloc]initWithFrame:CGRectMake(260, 120, width-270, 286.5)];
    introduction.font=[UIFont fontWithName:@"Avenir" size:20];
    introduction.text=@"导演:庵野秀明、摩砂雪、鹤卷和哉\n监制:庵野秀明\n编剧:庵野秀明\n主演:緒方惠美、林原惠、三石琴乃、關智一\n配乐作曲:鷺巣詩郎\n剪辑:奧田浩史\n制片商:Studio Khara\n发行商:KlockWorx、Khara\n片长:98min\n上映日期:2007年9月1日";
    introduction.lineBreakMode=NSLineBreakByWordWrapping;
    introduction.numberOfLines=0;
    //[self.view addSubview:introduction];
    [self.view insertSubview:introduction belowSubview:posterOfKyu];
    
    UITapGestureRecognizer *posterOfKyuTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClicked:)];
    [posterOfKyu addGestureRecognizer:posterOfKyuTap];
    
    // Do any additional setup after loading the view.
    link=[[UIButton alloc]initWithFrame:CGRectMake(30, 430, width/5, 40)];
    [link setTitle:@"相关链接" forState:UIControlStateNormal];
    [link setTitleColor:white forState:UIControlStateNormal];
    [link setBackgroundColor:evil];
    link.alpha=0.9;
    [link addTarget:self action:@selector(touchLinkButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:link belowSubview:posterOfKyu];
    
    character=[[UIButton alloc]initWithFrame:CGRectMake(30+width/5, 430, width/5, 40)];
    [character setTitle:@"登场角色" forState:UIControlStateNormal];
    [character setTitleColor:evil forState:UIControlStateNormal];
    [character setBackgroundColor:white];
    character.alpha=0.7;
    character.layer.borderColor=[evil CGColor];
    [character addTarget:self action:@selector(touchCharacterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:character belowSubview:posterOfKyu];
    
    eva=[[UIButton alloc]initWithFrame:CGRectMake(30+2*width/5, 430, width/5, 40)];
    [eva setTitle:@"EVA" forState:UIControlStateNormal];
    [eva setTitleColor:evil forState:UIControlStateNormal];
    [eva setBackgroundColor:white];
    eva.alpha=0.7;
    [eva addTarget:self action:@selector(touchEVAButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:eva belowSubview:posterOfKyu];
    
    angel=[[UIButton alloc]initWithFrame:CGRectMake(30+3*width/5, 430, width/5, 40)];
    [angel setTitle:@"使徒" forState:UIControlStateNormal];
    [angel setTitleColor:evil forState:UIControlStateNormal];
    [angel setBackgroundColor:white];
    angel.alpha=0.7;
    [angel addTarget:self action:@selector(touchAngelButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:angel belowSubview:posterOfKyu];
    
    linkScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    linkScrollView.tag=1;
    [linkScrollView setBackgroundColor:[UIColor clearColor]];
    UIView *maskOfLink=[[UIView alloc]initWithFrame:linkScrollView.bounds];
    [maskOfLink setBackgroundColor:evil];
    maskOfLink.alpha=0.7;
    [linkScrollView addSubview:maskOfLink];
    [self.view insertSubview:linkScrollView aboveSubview:posterOfKyu];
    
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
    Baike.text=@"新世纪福音战士新剧场版:Q";
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
    wikia.text=@" You Can (Not) Redo";
    wikia.font=[UIFont fontWithName:@"Avenir" size:30];
    wikia.userInteractionEnabled=YES;
    wikia.textColor=malibu;
    [linkScrollView addSubview:wikia];
    UITapGestureRecognizer *wikiaTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wikiaTap)];
    [wikia addGestureRecognizer:wikiaTap];
    UILabel *evangelionCo=[[UILabel alloc]initWithFrame:CGRectMake(260, 215, 400, 50)];
    evangelionCo.text=@" ヱヴァンゲリヲン新劇場版:Q";
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
    [characterScrollView setContentSize:CGSizeMake(width/5*8, 500)];
    [characterScrollView setShowsHorizontalScrollIndicator:NO];
    UIView *maskOfCharacter=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width/5*8, 500)];
    [maskOfCharacter setBackgroundColor:evil];
    maskOfCharacter.alpha=0.7;
    [characterScrollView addSubview:maskOfCharacter];
    [self.view insertSubview:characterScrollView aboveSubview:posterOfKyu];
    
    UIView *shinji=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 170, 500)];
    UIImageView *shinjiImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    shinjiImage.image=[UIImage imageNamed:@"Shinji_(Plugsuit_13).png"];
    [shinji addSubview:shinjiImage];
    UILabel *shinjiLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    shinjiLabel.text=@"碇真嗣";
    shinjiLabel.textColor=white;
    shinjiLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [shinji addSubview:shinjiLabel];
    [characterScrollView addSubview:shinji];
    
    UIView *kaworu=[[UIView alloc]initWithFrame:CGRectMake(250, 30, 170, 500)];
    UIImageView *kaworuImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110, 400)];
    kaworuImage.image=[UIImage imageNamed:@"Kaworu_Nagisa_(Mark.06_Plugsuit).png"];
    [kaworu addSubview:kaworuImage];
    UILabel *kaworuLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 130, 40)];
    kaworuLabel.text=@"渚薰";
    kaworuLabel.textColor=white;
    kaworuLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [kaworu addSubview:kaworuLabel];
    [characterScrollView addSubview:kaworu];
    
    UIView *asuka=[[UIView alloc]initWithFrame:CGRectMake(460, 30, 170, 470)];
    UIImageView *asukaImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    asukaImage.image=[UIImage imageNamed:@"Asuka_(Plugsuit_02_in_3.0).png"];
    [asuka addSubview:asukaImage];
    UILabel *asukaLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 170, 40)];
    asukaLabel.text=@"明日香";
    asukaLabel.textColor=white;
    asukaLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [asuka addSubview:asukaLabel];
    [characterScrollView addSubview:asuka];
    
    UIView *mari=[[UIView alloc]initWithFrame:CGRectMake(670, 30, 170, 470)];
    UIImageView *mariImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 400)];
    mariImage.image=[UIImage imageNamed:@"Mari_(Plugsuit_08).png"];
    [mari addSubview:mariImage];
    UILabel *mariLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 170, 40)];
    mariLabel.text=@"真希波";
    mariLabel.textColor=white;
    mariLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [mari addSubview:mariLabel];
    [characterScrollView addSubview:mari];
    
    UIView *rei=[[UIView alloc]initWithFrame:CGRectMake(880, 30, 130, 470)];
    UIImageView *reiImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 400)];
    reiImage.image=[UIImage imageNamed:@"'Rei'_(Plugsuit_09).png"];
    [rei addSubview:reiImage];
    UILabel *reiLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 170, 40)];
    reiLabel.text=@"绫波丽";
    reiLabel.textColor=white;
    reiLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    [rei addSubview:reiLabel];
    [characterScrollView addSubview:rei];
    
    evaScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    evaScrollView.tag=0;
    evaScrollView.alpha=0;
    [evaScrollView setBackgroundColor:[UIColor clearColor]];
    [evaScrollView setContentSize:CGSizeMake(width/5*8+50, 500)];
    [evaScrollView setShowsHorizontalScrollIndicator:NO];
    UIView *maskOfEva=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width/5*8+50, 500)];
    [maskOfEva setBackgroundColor:evil];
    maskOfEva.alpha=0.7;
    [evaScrollView addSubview:maskOfEva];
    [self.view insertSubview:evaScrollView aboveSubview:posterOfKyu];
    
    UIView *eva02=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 130, 450)];
    UIImageView *evaImage02=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 390)];
    evaImage02.image=[UIImage imageNamed:@"Evangelion_Unit-02'β.png"];
    [eva02 addSubview:evaImage02];
    UILabel *evaLabel02=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    evaLabel02.text=@"二号机";
    evaLabel02.textColor=white;
    evaLabel02.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva02 addSubview:evaLabel02];
    [evaScrollView addSubview:eva02];
    UIView *eva02beast=[[UIView alloc]initWithFrame:CGRectMake(300, 30, 200, 450)];
    UIImageView *evaImage02beast=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 390)];
    evaImage02beast.image=[UIImage imageNamed:@"Evangelion_Unit-02'γ_Code_777.png"];
    [eva02beast addSubview:evaImage02beast];
    UILabel *evaLabel02beast=[[UILabel alloc]initWithFrame:CGRectMake(0, 400, 200, 40)];
    evaLabel02beast.text=@"二号机兽化";
    evaLabel02beast.textColor=white;
    evaLabel02beast.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva02beast addSubview:evaLabel02beast];
    [evaScrollView addSubview:eva02beast];
    UIView *eva08=[[UIView alloc]initWithFrame:CGRectMake(570, 30, 130, 430)];
    UIImageView *evaImage08=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 390)];
    evaImage08.image=[UIImage imageNamed:@"Evangelion_Unit_08_Beta_artwork.png"];
    [eva08 addSubview:evaImage08];
    UILabel *evaLabel08=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 130, 40)];
    evaLabel08.text=@"八号机";
    evaLabel08.textColor=white;
    evaLabel08.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva08 addSubview:evaLabel08];
    [evaScrollView addSubview:eva08];
    UIView *eva09=[[UIView alloc]initWithFrame:CGRectMake(840, 30, 170, 450)];
    UIImageView *evaImage09=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 390)];
    evaImage09.image=[UIImage imageNamed:@"Evangelion_Mark.09_(Adams'_Vessel).png"];
    [eva09 addSubview:evaImage09];
    UILabel *evaLabel09=[[UILabel alloc]initWithFrame:CGRectMake(10, 400, 170, 40)];
    evaLabel09.text=@"九号机";
    evaLabel09.textColor=white;
    evaLabel09.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva09 addSubview:evaLabel09];
    [evaScrollView addSubview:eva09];
    UIView *eva13=[[UIView alloc]initWithFrame:CGRectMake(1110, 30, 200, 450)];
    UIImageView *evaImage13=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 390)];
    evaImage13.image=[UIImage imageNamed:@"Evangelion_13_Artwork.png"];
    [eva13 addSubview:evaImage13];
    UILabel *evaLabel13=[[UILabel alloc]initWithFrame:CGRectMake(0, 400, 200, 40)];
    evaLabel13.text=@"十三号机";
    evaLabel13.textColor=white;
    evaLabel13.font=[UIFont fontWithName:@"Avenir" size:40];
    [eva13 addSubview:evaLabel13];
    [evaScrollView addSubview:eva13];
    
    angelScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 480, width-60, 500)];
    angelScrollView.tag=0;
    angelScrollView.alpha=0;
    [angelScrollView setBackgroundColor:[UIColor clearColor]];
    UIView *maskOfAngel=[[UIView alloc]initWithFrame:linkScrollView.bounds];
    [maskOfAngel setBackgroundColor:evil];
    maskOfAngel.alpha=0.7;
    [angelScrollView addSubview:maskOfAngel];
    [self.view insertSubview:angelScrollView aboveSubview:posterOfKyu];
    UIView *angel12=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 400, 400)];
    UIImageView *angelImage12=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    angelImage12.image=[UIImage imageNamed:@"Twelfth_Angel.png"];
    [angel12 addSubview:angelImage12];
    UILabel *angelLabel12=[[UILabel alloc]initWithFrame:CGRectMake(0, 410, 400, 40)];
    angelLabel12.text=@"第十二使徒";
    angelLabel12.textColor=white;
    angelLabel12.textAlignment=NSTextAlignmentCenter;
    angelLabel12.font=[UIFont fontWithName:@"Avenir" size:40];
    [angel12 addSubview:angelLabel12];
    [angelScrollView addSubview:angel12];
    
}
#pragma mark buttonClicked
-(void) buttonClicked:(id)sender
{
    if (posterOfKyuiseven) {
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(200,286.5)];
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(width/2, height/2)];
        [posterOfKyu.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(3.0f, 3.0f)];
        scaleAnimation.springBounciness = 15.0f;
        scaleAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfKyu.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        posterOfKyuiseven=!posterOfKyuiseven;
    }else{
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(3.0f, 3.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.springBounciness = 10.0f;
        //scaleAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfKyu.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(width/2, height/2)];
        positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(130, 263.25)];
        positionAnimation.beginTime=CACurrentMediaTime()+0.4;
        [posterOfKyu.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        posterOfKyuiseven=!posterOfKyuiseven;
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
    //    loadViewController *lvc=[[loadViewController alloc]init];
    //    lvc.transitioningDelegate=self;
    if ([self.presentingViewController isKindOfClass:[mainViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        mainViewController *mvc=[[mainViewController alloc]init];
        mvc.transitioningDelegate=self;
        [self presentViewController:mvc animated:YES completion:nil];
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
    wvc.urlString=@"http://zh.wikipedia.org/wiki/福音戰士新劇場版：Q";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)wikiENTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://en.wikipedia.org/wiki/Evangelion:_3.0_You_Can_(Not)_Redo";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)wikiJPTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://ja.wikipedia.org/wiki/ヱヴァンゲリヲン新劇場版:Q";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)baikeTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://baike.baidu.com/view/6365473.htm";
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
    wvc.urlString=@"http://evangelion.wikia.com/wiki/Evangelion:_3.0_You_Can_(Not)_Redo";
    [self presentViewController:wvc animated:YES completion:nil];
}
-(void)evangelionCoTap
{
    webViewController *wvc=[[webViewController alloc]init];
    wvc.transitioningDelegate=self;
    wvc.urlString=@"http://www.evangelion.co.jp/news.html";
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
