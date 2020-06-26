val = True
(* What follows pertains to accuracy *)
assgn0 = 1
assgnu1 = Integrate[(eps)/2*assgn0*Exp[-(eps)*Abs[x - (-1)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[-1,eps]:cast_plus=0:*)
assgn2 = assgnu1/.{x -> -2}
If[Resolve[ForAll[eps, eps > 0, ((((assgn2))) \[GreaterEqual] (1 - (1)/(Exp[eps*1])))]],Print["OK"]; Print["P(1|-1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn2)) < (1 - (1)/(Exp[eps*1]))), eps, Reals]]; Null)]
assgnu7 = Integrate[(eps)/2*assgn0*Exp[-(eps)*Abs[x - (0)]], {x, x, 1}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[0,eps]:cast_plus=1:*)
assgn8 = assgnu7/.{x -> -1}
If[Resolve[ForAll[eps, eps > 0, ((((assgn8))) \[GreaterEqual] (1 - (1)/(Exp[eps*1])))]],Print["OK"]; Print["P(1|0) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|0) < beta"]; Print[FindInstance[(eps > 0 && ((assgn8)) < (1 - (1)/(Exp[eps*1]))), eps, Reals]]; Null)]
assgnu13 = Integrate[(eps)/2*assgn0*Exp[-(eps)*Abs[x - (1)]], {x, x, 2}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[1,eps]:cast_plus=2:*)
assgn14 = assgnu13/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn14))) \[GreaterEqual] (1 - (1)/(Exp[eps*1])))]],Print["OK"]; Print["P(1|1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn14)) < (1 - (1)/(Exp[eps*1]))), eps, Reals]]; Null)]
Print[val]
Exit[]
