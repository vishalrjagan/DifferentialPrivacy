val = True
(* What follows pertains to accuracy *)
assgn0 = 1
assgnu4 = Integrate[((4*eps)/(9*1))/2*assgn0*Exp[-((4*eps)/(9*1))*Abs[x - (0)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_thresh1=LaplaceDistribution[0,(4*eps)/(9*1)]:*)
assgnu6 = Integrate[(eps/(9*1))/2*assgnu4*Exp[-(eps/(9*1))*Abs[x - (-2)]], {x, x, \[Infinity]}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[-2,eps/(9*1)]:noisy_thresh0=LaplaceDistribution[0,(4*eps)/(9*1)]:*)
assgn7 = Limit[assgnu6, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*noisy_q0=LaplaceDistribution[-2,eps/(9*1)]:noisy_thresh0=LaplaceDistribution[0,(4*eps)/(9*1)]:*)
assgn5 = Limit[assgnu4, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*noisy_thresh1=LaplaceDistribution[0,(4*eps)/(9*1)]:*)
If[Resolve[ForAll[eps, eps > 0, ((((assgn0)*(assgn0)*(assgn7)*(assgn5)*(assgn0))) \[GreaterEqual] (1 - (1)*(((2*1 + 1)*1) / (Exp[(2*eps)/(9*1)]))))]],Print["OK"]; Print["P(1|-2) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|-2) < beta"]; Print[FindInstance[(eps > 0 && ((assgn0)*(assgn0)*(assgn7)*(assgn5)*(assgn0)) < (1 - (1)*(((2*1 + 1)*1) / (Exp[(2*eps)/(9*1)])))), eps, Reals]]; Null)]
assgnu8 = Integrate[(eps/(9*1))/2*assgn0*Exp[-(eps/(9*1))*Abs[x - (2)]], {x, x, 4}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_q0=LaplaceDistribution[2,eps/(9*1)]:cast_plus0=4:*)
assgn9 = assgnu8/.{x -> 0}
assgnu10 = Integrate[((4*eps)/(9*1))/2*assgn9*Exp[-((4*eps)/(9*1))*Abs[x - (0)]], {x, x, 0}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_thresh0=LaplaceDistribution[0,(4*eps)/(9*1)]:cast_minus0=0:noisy_q0=LaplaceDistribution[2,eps/(9*1)]:cast_plus0=4:*)
assgn11 = Limit[assgnu10, {x -> -\[Infinity]}, Assumptions -> Re[eps]>0] (*noisy_thresh0=LaplaceDistribution[0,(4*eps)/(9*1)]:cast_minus0=0:noisy_q0=LaplaceDistribution[2,eps/(9*1)]:cast_plus0=4:*)
assgnu12 = Integrate[((4*eps)/(9*1))/2*assgnu8*Exp[-((4*eps)/(9*1))*Abs[x - (0)]], {x, x, 4}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && (eps > 0)] (*noisy_thresh0=LaplaceDistribution[0,(4*eps)/(9*1)]:noisy_q0=LaplaceDistribution[2,eps/(9*1)]:cast_plus0=4:*)
assgn13 = assgnu12/.{x -> 0}
If[Resolve[ForAll[eps, eps > 0, ((((assgn11+assgn13)*(assgn5)*(assgn0))) \[GreaterEqual] (1 - (1)*(((2*1 + 1)*1) / (Exp[(2*eps)/(9*1)]))))]],Print["OK"]; Print["P(1|2) >= 1 - beta"],(Print["Accuracy failure"]; Print["P(1|2) < beta"]; Print[FindInstance[(eps > 0 && ((assgn11+assgn13)*(assgn5)*(assgn0)) < (1 - (1)*(((2*1 + 1)*1) / (Exp[(2*eps)/(9*1)])))), eps, Reals]]; Null)]
Print[val]
Exit[]
