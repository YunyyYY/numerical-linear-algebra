# Chapter 5 Projection



### 1. Projection

A projection is a linear map of a vector space $X$ to itself: $\mathcal P: X\rightarrow X$ such that $\mathcal P^2 = \mathcal P$.

When $X = \C^n$ this map is represented by a projector matrix $\mathcal P\in\C^{n\times n}$ s.t. $\mathcal P^2 =\mathcal P$. Projectors are square matrices.

**Example**

Projector on $\mathrm{span}\{u\}$, 
$$
P = \frac{uu^*}{\|u\|^2_2},\qquad P^2 = \frac{uu^*}{\|u\|^2_2}\cdot \frac{uu^*}{\|u\|^2_2} = \frac{uu^*(u^*u)}{\|u\|^4_2} = \frac{uu^*\|u\|^2_2}{\|u\|^4_2} = \frac{uu^*}{\|u\|^2_2} = P
$$
**Remark**: if $\mathcal P$ is a projector then $\mathcal I_n - \mathcal P$ is also a projector: **complementory projection** of $\mathcal P$.
$$
(\mathcal I_n - \mathcal P)^2 = \mathcal I_n - \mathcal P - \mathcal P + \mathcal P^2 = \mathcal I_n - \mathcal P
$$

#### <font color='red'>Projection theorm</font>

1. if $P\in\C^{n\times n}$ is a projector, then $\C^n = \operatorname{range}P\oplus\operatorname{null}P$, and $\operatorname{null}P = \operatorname{range}(\mathcal I_n-P)$, $\operatorname{null}(\mathcal I_n-P) = \operatorname{range}P$

   > $\forall v\in \operatorname{range}(P)$, $\exists x\in\C^n: v=Px$.
   >
   > $(I_n - P)v = v-Pv = Px - P^2x = 0$ thus $ \operatorname{range}(P) \subseteq \operatorname{null} (I_n - P)$.
   >
   > $\forall v\in \operatorname{null}(I_n - P)$, $(I_n-P)v = 0$, $v = Pv \in \operatorname{range}(P)$, thus $\operatorname{null}(I_n - P)\subseteq\operatorname{range} P$
   >
   > So $\operatorname{null}(I_n - P) = \operatorname{range} P$.
   >
   > Similarly $\operatorname{null}(P)=\operatorname{range} (I_n - P)$.
   >
   > Since $\operatorname{null}(P)\cap\operatorname{range} P = \{0\}$, $\C^n = \operatorname{range}P\oplus\operatorname{null}P$.

2. let $S_1$, $S_2$ be two subspaces of $\C^n$ that intersect at $0$ s.t. $\C^n = S_1\oplus S_2$ , $\exists$ projector $P$ s.t. $S_1 = \operatorname{range}P$ and $S_2 = \operatorname{null}P$

   > Let $\{u_1, ...u_r\}$ basis of $S_1$, $\{u_{r+1}, ...u_n\}$ basis of $S_2$.
   >
   > Thusm $\{u_1, ...u_n\}$ basis of $\C^n$.
   >
   > Define $P$ such that $\forall v\in\C^n$ $v=\sum_{j=1}^nc_ju_j$ and $Pv = \sum_{j=1}^rc_ju_j$. Thus, $P^2v = P(Pv) = Pv$. 
   >
   > <font color='red'>P reduces the dimension of vectors to r</font>.
   >
   > By construction, $\operatorname{range}P\subseteq S_1$, because $\forall v\in S_1: v = \sum_{j=1}^rc_ju_j = Pv$.
   >
   > Thus $S_2 = \operatorname{range}(I_n-P) = \operatorname{null}(P)$.
   >
   > <font color='red'>S1 and S2 need not be orthogonal.</font>

**Definition**: a projector $P\in\C^{n\times n}$ is called orthogonal if it divides $\C^n$ in two orthogonal complementart subspaces:
$$
(\operatorname{range} P)^\perp = \operatorname{null} P
$$
In general projector is not invertible and has **non-trivial null space**.

<font color='red'>An orthogonal projector is NOT an orthogonal matrix.</font>

**Theorem 2**: a projector $P\in \C^{n\times n}$ is orthogonal iff $P = P^*$. A projector is orthogonal iff Hermitian.

> 1. If $S_1 = \operatorname{span}\{u_1, ...u_r\}$ and $u_1...u_r$ are orthonormal, then we have **orthogonal projector on** $S_1$ is $P=\hat U\hat U^*$ for $\hat U = (u_1, ...u_r)$.
>
> 2. If not orthonormal, for arbitrary basis $S_1 = \operatorname{span}\{u_1, ...u_r\}$, let $\hat U = (u_1, ...u_r)$,
>
>    $\operatorname{range}(P) = \operatorname{range}(\hat U) = S_1$
>
>    $\forall x\in\C^n$, $Px\in S_1$, $(I_n-P)x\in S_2$ and $u_j^*(I_n-P)x = 0$, $\Rightarrow \hat U^*(x-Px) = 0$.
>
>    But since $Px\in \operatorname{range} \hat U$, $\exists \xi\in\C^n$ s.t. $Px = \hat U\xi$.
>
>    $\hat U^*x = \hat U^*Px = \hat U^*\hat U\xi$ and $\xi = (\hat U^*\hat U)^{-1}\hat U^*x$ is unique.
>
>    Thus $Px = \hat U\xi = \hat U (\hat U^*\hat U)^{-1}\hat U^*x $ for any $x\in\C^n$.
>
>    Thus $P = \hat U (\hat U^*\hat U)^{-1}\hat U^*$. If the basis are orthonormal, $\hat U^*\hat U = I_n$.



For example, for overdetermined $m\ge n$, $u_i^*$ is the $i$ **column** of $U^*$,
$$
\left(\begin{matrix}
\sigma_1 & 0 & \cdots & 0\\
0 & \sigma_2 & \cdots & 0\\
0 & 0 & \ddots & 0 \\
 &  & \cdots & \\
\end{matrix}\right) \underline{y} = \left(\begin{matrix}
u_1^*b\\
u_2^*b\\
\vdots \\
u_m^*b \\
\end{matrix}\right) = \left(\begin{matrix}
\vdots\\
\sigma_r^*y_r\\
0 \\
\vdots \\
\end{matrix}\right)
$$
$u_j^*b$ is the inner product $\left<u_j, b\right>$. Thus solution exists if $b\perp \operatorname{span}(u_{r+1}, ...u_m)$, i.e., $b\in\operatorname{range} A$ and under such case
$$
\left\{
\begin{array}
&y_j = \frac{u_j^*b}{\sigma_j}, &j = 1,... r \\
y_j \text{ unspecified}, &j = r+1, ... m
\end{array}
\right.
$$

