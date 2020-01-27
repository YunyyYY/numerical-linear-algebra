# Chapter 1 Fundamentals

### 1. Basics

#### Matrix

A linear map between vector spaces:
$$
\mathbb{C}^n \xrightarrow{A} \mathbb{C}^m
$$
meaning $\forall x \in \mathbb{C}^n$, $Ax\in \mathbb{C}^m$. We say $A \in \mathbb{C}^{m\times n}$.

#### Vector space

A vector space $V$ is a set that is closed under finite vector addition and scalar multiplication.

#### Span

The linear span or simply span of $(v_1, . . ., v_m)$ is defined as
$$
\operatorname{span}\left(v_{1}, \ldots, v_{m}\right) := \left\{a_{1} v_{1}+\cdots+a_{m} v_{m} | a_{1}, \ldots, a_{m} \in \mathbb{F}\right\}
$$
where $V$ denote a vector space over $\mathbb{F}$ and vectors $v_{1}, v_{2}, \ldots, v_{m} \in V$.

$\operatorname{span}\left(v_{1}, \ldots, v_{m}\right)$ is a **subspace** of $V$.

If $\operatorname{span}\left(v_{1}, \ldots, v_{m}\right) = V$ we say that $\left(v_{1}, \ldots, v_{m}\right)$ **spans** $V$.

#### Linear independence

A list of vectors $\left(v_{1}, \ldots, v_{m}\right)$ is called linearly independent if the only solution for $a_{1}, \dots, a_{m} \in \mathbb{F}$ to the equation $\begin{equation}a_{1} v_{1}+\cdots+a_{m} v_{m}=0\end{equation}$ is $\begin{equation} a_{1}=\cdots=a_{m}=0\end{equation}$.

The list of vectors $\left(v_{1}, \ldots, v_{m}\right)$ is linearly independent if and only if every $v\in \operatorname{span}\left(v_{1}, \ldots, v_{m}\right)$ can be uniquely written as a linear combination of $\left(v_{1}, \ldots, v_{m}\right)$.

#### Basis

A set of vectors that is linearly independent and spans the space.

A basis of a finite-dimensional vector space is a spanning list that is also linearly independent. We will see that all bases of finite-dimensional vector spaces have the same length. This length will be the dimension of our vector space.

#### Definition

If $V, M$ are vector spaces over some field $F$, $\varphi: V \rightarrow W$ is a linear map if $\varphi(\alpha v + \alpha'v') = \alpha \varphi v + \alpha' \varphi v'$ for all $v, v' \in V$ and all $\alpha, \alpha' \in F$.

Map $\mathbb{C}^n \xrightarrow{A} \mathbb{C}^m$ is linear.

Once we obtain bases of $\mathbb{C}^n$, $\mathbb{C}^m$, map $\varphi$ is represented by $A\in \mathbb{C}^{n\times m}$, where $a_{ij} = $ coefficient of $\varphi(u_j)$ in basis $\{v_1, ...v_m\}$ of $\mathbb{C}^m$.

> A useful way of writing matrix vector multiplication, writing matrix as a combination of column vectors.
> $$
> \underline{b} = A\underline{x} = \left(\underline{a_1}, ... \underline{a_m}\right) \left(\begin{array}{c}{x_{1}} \\ {\vdots} \\ {x_{m}}\end{array}\right) = \sum_{j=1}^mx_j\underline{a_j}
> $$
> In particular, $A\underline{e_j} = \underline{a_j}$.



### 2. Complex inner product

> Hermitian inner product on a complex vector space.

An inner product on $\mathbb{C}^n$ is a map $<\cdot, \cdot>: \mathbb{C}^n\times \mathbb{C}^n \rightarrow \mathbb{C}$ s.t.

1. $<x, x> \in \mathbb{R}^+$ and $<x, x> = 0$ iff $x=0$
2. <font color=#ef475d>Conjugate: in general, NO commutative property, </font>$<x, y> = \overline{<y, x>}$, $\forall x, y\in \mathbb{C}^n$
3. $<x, \alpha y> = \alpha<x, y>$, $\forall x, y\in \mathbb{C}^n$, $\forall \alpha \in \mathbb{C}$ <font color=#ef475d>Note that the position of a constant coefficient could only be in front of y!</font>
4. $<x, y+z> = <x, y> + <x, z>$, 
5.  $<\alpha x, y> = \overline{<y, \alpha x>} = \overline{\alpha}\overline{<y, x>} = \overline{\alpha}<x, y> $

The vector space $\mathbb{C}^n$ has a standard inner product $<u, v> = \sum_{i=1}^n \overline{u_i}v_i = u^*v$, since $u^* = \overline{u}^T$ so $<u, v> = \overline{u}^Tv$.

#### Cauchy–Schwarz inequality

$$
\begin{equation}
\left|\sum_{i=1}^{n} u_{i} \bar{v}_{i}\right|^{2} \leq \sum_{j=1}^{n}\left|u_{j}\right|^{2} \sum_{k=1}^{n}\left|v_{k}\right|^{2}
\end{equation}
$$

Equality holds iff $u$, $v$ are linearly dependent.

#### Orthogonal Set

A subset $X$ of a vector space $\mathbb{C}^n$, if $\forall x, y\in X$, $x\neq y$ we have $<x, y> = 0$, the set is called orthogonal. 

Two sets $X$, $Y\in \mathbb{C}^n$ are orthogonal to each other if $<x, y> = 0$ for $\forall x\in X$ and $\forall y \in Y$.



### 3. Adjoint

The *hermitian conjugate* or *adjoint* of an $m\times n$ matrix $A$, written $A^*$, is the $n\times m$ matrix whose $i, j$ entry is the complex conjugate of the $j, i$ entry of $A$.

For example:
$$
\begin{equation}
A=\left[\begin{array}{ll}{a_{11}} & {a_{12}} \\ {a_{21}} & {a_{22}} \\ {a_{31}} & {a_{32}}\end{array}\right] \quad \Rightarrow \quad A^{*}=\left[\begin{array}{lll}{\bar{a}_{11}} & {\bar{a}_{21}} & {\bar{a}_{31}} \\ {\bar{a}_{12}} & {\bar{a}_{22}} & {\bar{a}_{32}}\end{array}\right]
\end{equation}
$$
Given $A\in \mathbb{C}^{m\times n}$, the adjoint $A^*$ is a matrix in $\mathbb{C}^{m\times n}$ defined by $(A^*)_{ij} = (\overline{a}_{ji})$. $\overline{a}_{ji}$ is the $(j, i)$ term in the <font color=#ef475d>cofactor matrix</font> of $A$.

**Hermitian**: $A = A^*$.

If $A\in\mathbb{R}^{n\times n}$ and $A = A^T$, $A$ is symmetric.

**Unitary**: $A^*A = AA^* = I$.  The column vectors of $A$, $\{a_1, ... a_n\}$ are orthonormal, which forms a basis of $\mathbb{C}^n$: $<a_i, a_j> = \delta_{i, j}$.

If $A\in\mathbb{R}^{n\times n}$ and $A^TA = AA^T = I$, $A$ is orthogonal.



### 4. The four fundamental spaces

$\mathrm{range} A = \{y\in\mathbb{C}^m: \exist x \in\mathbb{C}^n s.t. y = Ax\} = \mathrm{span}\{\underline a_1, ...\underline a_n\}$, column space of $A$.

> The **image** of a [linear transformation](https://www.projectrhea.org/rhea/index.php/Linear_transformation) or [matrix](https://www.projectrhea.org/rhea/index.php/Matrix) is the [span](https://www.projectrhea.org/rhea/index.php/Span) of the vectors of the linear transformation. (Think of it as what vectors you can get from applying the linear transformation or multiplying the matrix by a vector.) It can be written as *Im(A)*.
>
> Reference: [The concept of "image"](https://www.projectrhea.org/rhea/index.php/Image_(linear_algebra)).

$\mathrm{range} A$ is subspace of $\mathbb{C}^m$.

$\mathrm{range} A^* = \{z\in\mathbb{C}^n: \exist y \in\mathbb{C}^m s.t. z = A^*y\} = \mathrm{span}\{\underline a^*_1, ...\underline a^*_m\}$, where $\underline a^*_j$ is the $j$th column of $A^*$, which is the complex coonjugate of $j$th row of $A$.

$\mathrm{null}A = \{x\in\mathbb{C}^n: Ax = 0\}$ is subspace of $\mathbb{C}^n$.

$\mathrm{null}A^* = \{y\in\mathbb{C}^m: A^*y = 0\}$ is subspace of $\mathbb{C}^m$.

>  #### Theorem 1
>
> Let $A\in\mathbb{C}^{m\times n}$, we have $\dim \operatorname{range} A = \dim \operatorname{range}A^* =: \operatorname{rank} A \le \min\{m, n\}$. The two ranges are also called column rank, row rank respectively.

$A$ is called full rank if $\operatorname{rank}A = \min\{m, n\}$.

> #### Theorem 2 (Rank Nullity Theorem)
>
> Let $A\in \mathbb{C}^{m\times n}$, we have $\operatorname{range} A \oplus \operatorname{null} A^* = \mathbb{C}^m$ and $\operatorname{range} A^* \oplus \operatorname{null} A = \mathbb{C}^n$.

$\oplus$ is direct sum of spaces, and a vector in $\mathbb{C}^m$ can be uniquely decomposed into two vectors, one in $\operatorname{null} A^*$ (which is equivalent to $[\operatorname{range} A]^\perp$) and one in $\mathrm{range} A$.

Therefore, $m = \operatorname{rank} A + \dim\operatorname{null} A^*$, $\operatorname{rank} A^* \oplus \dim\operatorname{null} A$.

#### Consequence

For solving $Ax=b$, $A\in\mathbb{C}^{m\times n}$, $b\in\mathbb{C}^m$.

**Overdetermined system**: $m>n$. If $b\in \operatorname{range} A \Rightarrow$ subspace of dimension $n$ of $\mathbb{C}^m$. If $A$ is full rank, $\dim \operatorname{null}A = n - \operatorname{rank}A = n-n = 0$. There exists unique solution. However, if $A$ is not full rank, ${null}A\operatorname\neq \{0\}$ and there are infinitely many solutions.

**Underdetermined system**: $n > m$. If $b\in \operatorname{range}A = \mathbb{C}^m$. If $A$ is full rank, exists solution, but since $\dim \operatorname{null}A > 0$, there are infinitely many solutions. If $A$ is not full rank, also infinitely many solutions.



### 5. Solvability of square systems

Let $A\in\mathbb{C}^{n\times n}$, then $A$ is invertible $\equiv \operatorname{rank}A = n \equiv \operatorname{null}A = \{0\} \equiv \operatorname{range}A = \mathbb{C}^n$.



### 6. Determinant and Trace

Leibniz formula:
$$
\begin{equation}
\operatorname{det}(A)=\sum_{\tau \in S_{n}} \operatorname{sgn}(\tau) \prod_{i=1}^{n} a_{i, \tau(i)}
\end{equation}
$$
$\operatorname{sgn}$ is the sign function of permutations in the permutation group $S_n$, which returns $+1$ and $−1$ for even and odd permutations, respectively.

> #### Properties
>
> $\det I = 1$
>
> $\det A^\top = \det A$
>
> $\det A^{-1} = 1 / \det(A)$ for invertible $A$
>
> $\det AB = \det A\det B$
>
> $\det \alpha A = \alpha^n A$, where $n$ is dimension of $A$
>
> If $A$ is trianbular, $\det A = \prod_{i=1}^n a_{ii}$
>
> If $A$ is singular (has linearly dependent column), $\det A = 0$

Trace: $\operatorname{tr}A = \sum_{i=1}^n a_{ii}$. $\operatorname{tr}: \mathbb{C}^{n\times n} \rightarrow \mathbb{C}$ is a linear function.

> #### Properies
>
> $\operatorname{tr} (\alpha A + \beta B) = \alpha \operatorname{tr}A + \beta \operatorname{tr}B$
>
> $\operatorname{tr}A = \operatorname{tr}A^\top$
>
> $\operatorname{tr}(ABCD) = \operatorname{tr}(BCDA) = \operatorname{tr}(CDAB) = \operatorname{tr}(DABC)$ only cyclic permutation are allowed in general, unless all matrices in permutation are **symmetric**. In this case any permutation is okay.





