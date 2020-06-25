val = True
(* What follows pertains to accuracy *)
assgn0 = 1
assgnu4 = Integrate[((9*1)/(4*eps))/2*assgn0*Exp[-((9*1)/(4*eps))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_thresh1=LaplaceDistribution[0,(9*1)/(4*eps)]:*)
assgnu6 = Integrate[((9*1)/(2*eps))/2*assgnu4*Exp[-((9*1)/(2*eps))*Abs[x - (-1)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[-1,(9*1)/(2*eps)]:noisy_thresh0=LaplaceDistribution[0,(9*1)/(4*eps)]:*)
assgn7 = Limit[assgnu6, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*noisy_q0=LaplaceDistribution[-1,(9*1)/(2*eps)]:noisy_thresh0=LaplaceDistribution[0,(9*1)/(4*eps)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn0)*(assgn7)*(assgn0))) \[GreaterEqual] (1 - (1*4*1)/(Exp[(1.*eps)/(9*1)])))]],Print["OK"]; Print["P(1|-1) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-1) < beta"]; Print[FindInstance[(eps > 0 && ((assgn0)*(assgn7)*(assgn0)) < (1 - (1*4*1)/(Exp[(1.*eps)/(9*1)]))), eps, Reals]]; Null)]
