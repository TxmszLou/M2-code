loadPackage "Schubert2"

-- example: universal fano of lines in cubic surfaces
n=3
d=3
m=19

-- universal sequence for P^19 = P(Sym^3 V), V = k^4
-- 0 -> Z -> O_{P^19} * V -> Q1 -> 0
P = flagBundle({1,m}, VariableNames=>{z,q1})
(Z,Q1) = P.Bundles

-- universal sequence for G = G(2,n-1) pulled back to P^{19} * G
-- 0 -> S -> O_{P * G} * V -> Q -> 0
V = abstractSheaf(P, Rank=>n+1)
G = flagBundle({2, n-1}, V, VariableNames=>{s,q})
(S,Q) = G.Bundles

-- p : P^{19} * G -> P^{19}
p = G.StructureMap
-- ZG = p^* O_{P}(1)
ZG = p^*(dual Z)

-- compute the class of Phi = top chern class of the bundle
-- c_4 p^* O_{P}(1) ** Sym^d dual S
chern_4 (ZG**symmetricPower_d dual S)
