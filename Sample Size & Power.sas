/*T-TESTS*/
proc power;
	twosamplemeans test=diff sides=2 meandiff=2 stddev=1 power=0.8 alpha=0.05 
		npergroup=.;
run;

/*WILCOXON TEST*/
proc power;
	twosamplewilcoxon sides=2 vardist("Group 1")=normal(2, 1) 
		vardist("Group 2")=normal(4, 3) variables="Group 1" | "Group 2" power=0.8 
		alpha=0.05 npergroup=.;
run;

/*ONE-WAY ANOVA*/
proc power;
	onewayanova test=overall groupmeans=(3 6 9) stddev=3 power=0.8 alpha=0.05 
		npergroup=.;
run;

/*PEARSON CORRELATION*/
proc power;
	onecorr test=pearson dist=fisherz sides=2 power=0.8 alpha=0.05 corr=0.3
		ntotal=.;
run;

/*MULTIPLE REGRESSION*/
proc power;
	multreg test=type3 model=fixed power=0.8 alpha=0.05 nfullpredictors=3 
		nreducedpredictors=2 rsquarefull=0.66 rsquarereduced=0.64 ntotal=.;
run;

/*LOGISTIC REGRESSION*/
proc power;
	logistic test=lrchi vardist("X")=binomial(0.6, 168) power=0.8 alpha=0.05 
		TestPredictor="X" TestOddsRatio=1.14 ResponseProb=0.4 units=("X"=1) ntotal=.;
run;

/*SURVIVAL RANK TESTS*/
proc power;
	twosamplesurvival test=logrank sides=2 GroupMedSurvTimes=(96 168) 
		FollowupTime=24 TotalTime=288 power=0.8 alpha=0.05 npergroup=.;
run;

/*COX REGRESSION*/
proc power;
	coxreg test=score sides=2 eventprob=0.7 power=0.8 alpha=0.05 hazardratio=1.28 
		rsquare=0.68 stddev=2 ntotal=.;
run;