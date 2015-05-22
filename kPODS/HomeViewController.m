//
//  HomeViewController.m
//  kPODS
//
//  Created by Philip on 11/30/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view.
    _titles = @[@"Focus on the middle.",
                @"Play between the sheets.",
                @"Knit a scarf.",
                @"Power up your salsa.",
                @"Let the music move you.",
                @"Go fish.",
                @"LOL.",
                @"Stretch it out.",
                @"Raise a glass.",
                @"Shun the salt.",
                @"Move it, move it, move it.",
                @"Know your numbers.",
                @"Eat chocolate.",
                @"Let your housework work for you.",
                @"Go nuts.",
                @"Be a kid.",
                @"Consider pet therapy.",
                @"Stop smoking—no ifs, ands, or butts.",
                @"Start and stop.",
                @"Cut the fat.",
                @"Take the scenic route home.",
                @"Take the scenic route home.",
                @"Make time for breakfast.",
                @"Fake your fitness.",
                @"Brew up a heart healthy potion.",
                @"Smile.",
                @"Walk it off.",
                @"Pump some iron.",
                @"Find your happy place."];
    _tips = @[@"Your middle, that is. You don't have to be super-thin to reap the benefits of a smaller waistline, but according to the Journal of the American College of Cardiology, carrying too much weight around the middle raises blood pressure, affects blood lipids (and not in a good way), and does other damage to the heart. Abdominal exercises are good, but remember: it's calories in (what you eat) and calories out (how you exercise) that will make a difference.",
              @"…Or on top of the sheets, or in the kitchen, or wherever! Yep, having sex can be heart healthy. A number of studies show that sexual activity adds more than pleasure to your life. It can actually lower your blood pressure and your risk for developing heart disease.",
              @"Put your hands to work and your mind will unwind. Engaging in activities like knitting, sewing, and crocheting helps relieve stress and does your ticker a world of good. For the \"uncrafty\" lot who don't do needles, a jigsaw puzzle works great too.",
              @"A good salsa rich in antioxidants is a great snacking choice when paired with low-fat chips or fresh veggies. When you mix in a can of rinsed and drained black beans, you get a two-for-one special: according to the Mayo Clinic, adding soluble fiber into your diet helps lower bad (LDL) cholesterol. Add a dash of lime juice and a chopped jalapeno for an extra kick that will jumpstart your metabolism. ",
              @"Whether it's a rumba beat or a two-step tune that gets your body moving, dancing raises your heart rate, burns some calories (between 150-300 calories an hour), and makes for a great heart-healthy workout.",
              @"Studies have shown that including fish high in omega-3 fatty acids (i.e. salmon, herring, sardines, and tuna) into your diet can reduce the risk of heart disease by a third or more. To those concerned about the mercury content or other contaminants in fish, the Mayo Clinic states that the heart healthy benefits outweigh the possible risks of exposure to toxic elements.",
              @"Not in an email, not on Twitter or Facebook, but really: laugh out loud. Whether you like watching Family Guy or Seinfeld reruns, if it gets you chuckling, it’s good for your heart. Research from the University of Maryland Medical Center shows that laughter helps relieve the stress that damages the endothelium, the tissue that forms the inner lining of blood vessels and helps your blood flow. It also promotes the healthy function of blood vessels.",
              @"Practicing yoga makes you more limber and helps you relax, which combats stress. However, according to recent research from the Journal of Ayurveda and Integrative Medicine, it also positively affects the heart rate variability (HRV), which is an indicator for heart health.",
              @"Moderate consumption of alcohol can raise your HDL (good cholesterol) levels, reduce blood clot formation, and help prevent artery damage. Some studies say red wine offers more benefits than other alcoholic beverages. Other studies conflict with this. The answer is moderation. Talk to your doctor about potential benefits and risks.",
              @"Overwhelming research in the New England Journal of Medicine shows that if the entire US population reduced its salt intake to just a half teaspoon a day, we would significantly reduce the number of new cases of coronary heart disease. The studies also concluded that salt is one of the leading culprits in fueling the rise in healthcare costs in America. Most of our high salt intake comes from processed food and restaurant-prepared food. Think twice before filling up on your favorite fast-food fix.",
              @"A new study from Australia found that sitting for long periods of time could shorten your life regardless of your body weight. It appears that being a couch potato has an unhealthy influence on blood fats and blood sugar. At the office, work in \"get up\" breaks, and go for a stroll.",
              @"Keeping your blood pressure, blood sugar, cholesterol, and triglycerides in check are important for good heart health. Learn the optimal levels, and don't skip your regular physical exams.",
              @"No guilt required. Rich, dark chocolate not only tastes delicious, the flavonoids it contains can help stave off heart disease according to a study published in the American Journal of Clinical Nutrition. Preliminary research by Johns Hopkins also suggests that chocolate can positively affect blood clotting.",
              @"Vacuuming or mopping the floors may not be as invigorating as a Body Slam or Zumba class, but these activities and other household chores do burn calories. Put your favorite music on, and put some pep in your weekly chores.",
              @"Almonds, walnuts, pecans, and other tree nuts deliver a powerful punch for lowering your risk of cardiovascular and coronary heart disease. The American Heart Association suggests that substituting foods high in saturated fats with nuts helps reduce bad (LDL) cholesterol.",
              @"Fitness doesn't have to be boring. Plan an evening out roller skating or bowling. Do both, and you can burn (on average) around 600 calories, according to the Mayo Clinic.",
              @"Our pets give us more than unconditional love; they offer numerous health benefits. Studies reported by the National Institutes of Health (NIH) show that owning pets can lower the rate of dying from heart disease and possibly improve heart and lung function.",
              @"This nasty habit is one of the top controllable risk factors for heart disease. The AMA, AHA, NIH, and more than likely your mom recommend stubbing out this addiction to make a huge difference in your overall health.",
              @"And start again. The Mayo Clinic reports that during aerobic workouts, interval training (varying your speed and intensity in short bursts) will boost your calorie burn. Wear a heart rate monitor to make sure you’re hitting your target heart rates.",
              @"Slicing your fat intake to no more than 30 percent of your daily calories will help cut your risk for heart disease, according to the USDA. If you don’t normally read labels or count calories, think twice before you savour your next meal. Do a mental calculation of what you’re eating.",
              @"Put down your cell phone, forget about the driver who cut you off, and enjoy the ride. Eliminating stress while driving will help lower your blood pressure, which your cardiovascular system will appreciate.",
              @"The first meal of the day is one you shouldn't skip. There is an abundance of good-for-you benefits to eating a healthy breakfast. What’s a healthy breakfast exactly? Whole grains (ex. rolls, cereals, etc.), low-fat protein (ex. hard-boiled egg, turkey bacon), low-fat dairy (ex. skim milk, low-fat yogurt, or cheese), and fruits and vegetables.",
              @"It's a no-brainer that exercise is good for your coronary health, so why not sneak it in at every opportunity? Park on the far side of the parking lot, take the stairs, walk and talk with a friend instead of e-mailing, or play with your kids at the park instead of just watching them. Every little bit adds up to better health.",
              @"No magic is needed when you sip green or black tea. Studies from Harvard University and the National Institutes of Health (NIH) that focus on black and green varieties show that drinking tea can improve arterial health.",
              @"Good dental hygiene does more than keep your pearly whites glistening. It may affect your overall health. Research from Harvard suggests that several types of cardiovascular disease, including coronary artery disease, may be connected to oral health.",
              @"Next time you feel overwhelmed, get mad, or are totally exasperated, take a stroll. A five-minute walk will do wonders for clearing your head and lowering your stress levels.",
              @"Aerobic activities may be the star players in fitness for a healthy heart, but strength training needs to be part of the team. Its effect on weight control is awesome—more muscle mass means burning more calories. The American Heart Association gives strength training a thumbs-up for lowering the risk of heart disease.",
              @"A sunny outlook is good for your heart. Research from the University College London shows that those who are happy tend to have lower levels of the potentially harmful hormone cortisol and other stress-inducing chemicals."];
    [self.tabBarController setDelegate:(AppDelegate*)[[UIApplication sharedApplication] delegate]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    int i = rand()%28;
    _titleText.text = _titles[i];
    _content.text = _tips[i];
    
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
