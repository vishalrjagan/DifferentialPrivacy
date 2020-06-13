val = True
(* What follows pertains to accuracy *)
assgn0 = 1
assgnu1 = Integrate[(eps/2)/2*assgn0*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:*)
assgnu2 = Integrate[(eps/2)/2*assgnu1*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:*)
assgnu3 = Integrate[(eps/2)/2*assgnu2*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[-1,eps/2]:val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:*)
assgn4 = Limit[assgnu3, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val2=LaplaceDistribution[-1,eps/2]:val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn4)) + ((assgn4))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|-1 -1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|-1 -1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn4)) + ((assgn4)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu10 = Integrate[(eps/2)/2*assgn0*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[0,eps/2]:*)
assgnu11 = Integrate[(eps/2)/2*assgnu10*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:*)
assgnu12 = Integrate[(eps/2)/2*assgnu11*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:*)
assgn13 = Limit[assgnu12, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn13)) + ((assgn13))) \[GreaterEqual] (1 - 1/(Exp[eps*1/4])))]],Print["OK"]; Print["P(2|-1 -1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(2|-1 -1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn13)) + ((assgn13)) < (1 - 1/(Exp[eps*1/4]))), eps, Reals]]; Null)]
assgnu19 = Integrate[(eps/2)/2*assgn0*Exp[-(eps/2)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[1,eps/2]:*)
assgnu20 = Integrate[(eps/2)/2*assgnu19*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgnu21 = Integrate[(eps/2)/2*assgnu20*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn22 = Limit[assgnu21, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[-1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn22)) + ((assgn22))) \[GreaterEqual] (1 - 1/(Exp[eps*2/4])))]],Print["OK"]; Print["P(2|-1 -1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(2|-1 -1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn22)) + ((assgn22)) < (1 - 1/(Exp[eps*2/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13)) + ((assgn13))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|-1 0 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1 0 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn13)) + ((assgn13)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu25 = Integrate[(eps/2)/2*assgnu11*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:*)
assgn26 = Limit[assgnu25, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:*)
assgnu27 = Integrate[(eps/2)/2*assgnu10*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[0,eps/2]:val1=LaplaceDistribution[0,eps/2]:*)
assgnu28 = Integrate[(eps/2)/2*assgnu27*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:val1=LaplaceDistribution[0,eps/2]:*)
assgn29 = Limit[assgnu28, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[0,eps/2]:val1=LaplaceDistribution[0,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn26)) + ((assgn29))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|-1 0 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1 0 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn26)) + ((assgn29)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu34 = Integrate[(eps/2)/2*assgnu20*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn35 = Limit[assgnu34, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgnu41 = Integrate[(eps/2)/2*assgnu19*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgnu42 = Integrate[(eps/2)/2*assgnu41*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:val1=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn43 = Limit[assgnu42, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[-1,eps/2]:val1=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn35)) + ((assgn43))) \[GreaterEqual] (1 - 1/(Exp[eps*1/4])))]],Print["OK"]; Print["P(2|-1 0 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(2|-1 0 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn35)) + ((assgn43)) < (1 - 1/(Exp[eps*1/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn22)) + ((assgn22))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|-1 1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1 1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn22)) + ((assgn22)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn35)) + ((assgn43))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|-1 1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1 1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn35)) + ((assgn43)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu46 = Integrate[(eps/2)/2*assgnu20*Exp[-(eps/2)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn47 = Limit[assgnu46, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgnu48 = Integrate[(eps/2)/2*assgnu19*Exp[-(eps/2)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:*)
assgnu49 = Integrate[(eps/2)/2*assgnu48*Exp[-(eps/2)*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:*)
assgn50 = Limit[assgnu49, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[-1,eps/2]:val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn47)) + ((assgn50))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|-1 1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1 1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn47)) + ((assgn50)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn13)) + ((assgn13))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|0 -1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|0 -1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn13)) + ((assgn13)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn26)) + ((assgn29))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|0 -1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|0 -1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn26)) + ((assgn29)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn43)) + ((assgn35))) \[GreaterEqual] (1 - 1/(Exp[eps*1/4])))]],Print["OK"]; Print["P(2|0 -1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(2|0 -1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn43)) + ((assgn35)) < (1 - 1/(Exp[eps*1/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn29)) + ((assgn26))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|0 0 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|0 0 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn29)) + ((assgn26)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu51 = Integrate[(eps/2)/2*assgnu27*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[0,eps/2]:val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[0,eps/2]:*)
assgn52 = Limit[assgnu51, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val2=LaplaceDistribution[0,eps/2]:val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[0,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn52)) + ((assgn52))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|0 0 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|0 0 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn52)) + ((assgn52)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu57 = Integrate[(eps/2)/2*assgnu41*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn58 = Limit[assgnu57, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[0,eps/2]:val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn58)) + ((assgn58))) \[GreaterEqual] (1 - 1/(Exp[eps*1/4])))]],Print["OK"]; Print["P(2|0 0 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(2|0 0 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn58)) + ((assgn58)) < (1 - 1/(Exp[eps*1/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn43)) + ((assgn35))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|0 1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|0 1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn43)) + ((assgn35)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn58)) + ((assgn58))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|0 1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|0 1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn58)) + ((assgn58)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu61 = Integrate[(eps/2)/2*assgnu41*Exp[-(eps/2)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgn62 = Limit[assgnu61, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:*)
assgnu63 = Integrate[(eps/2)/2*assgnu48*Exp[-(eps/2)*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:*)
assgn64 = Limit[assgnu63, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val0=LaplaceDistribution[0,eps/2]:val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn62)) + ((assgn64))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(1|0 1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|0 1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn62)) + ((assgn64)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn22)) + ((assgn22))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 -1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 -1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn22)) + ((assgn22)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn35)) + ((assgn43))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 -1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 -1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn35)) + ((assgn43)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn47)) + ((assgn50))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 -1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 -1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn47)) + ((assgn50)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn43)) + ((assgn35))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 0 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 0 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn43)) + ((assgn35)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn58)) + ((assgn58))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 0 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 0 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn58)) + ((assgn58)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn62)) + ((assgn64))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 0 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 0 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn62)) + ((assgn64)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn50)) + ((assgn47))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 1 -1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 1 -1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn50)) + ((assgn47)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
If[Resolve[ForAll[eps, eps > 0, ((((assgn64)) + ((assgn62))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 1 0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 1 0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn64)) + ((assgn62)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
assgnu65 = Integrate[(eps/2)/2*assgnu48*Exp[-(eps/2)*Abs[x - (1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[1,eps/2]:*)
assgn66 = Limit[assgnu65, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*val2=LaplaceDistribution[1,eps/2]:val1=LaplaceDistribution[1,eps/2]:val0=LaplaceDistribution[1,eps/2]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn66)) + ((assgn66))) \[GreaterEqual] (1 - 1/(Exp[eps*0/4])))]],Print["OK"]; Print["P(0|1 1 1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(0|1 1 1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn66)) + ((assgn66)) < (1 - 1/(Exp[eps*0/4]))), eps, Reals]]; Null)]
Print[val]
Exit[]
