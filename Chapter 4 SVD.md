# Chapter 4 Singular Value Decomposition

Only square nondefective matrices can be diagonalized using eigenbases. SVD is more general as it applies to any matrix, even rectangular.

### 1. The decomposition

#### Full SVD

Let $A\in\mathbb C^{m\times n}$, the SVD is the factorization $A=U\Sigma V^*$ where $U\in\mathbb C^{m\times m}$ and $V\in\mathbb C^{n\times n}$ are unitary and $\Sigma\in\mathbb C^{m\times n}$ is diagonal with entries $\sigma_1 \ge \sigma_2 \ge ... \ge \sigma_o \ge 0$ for $p = \min\{m, n\}$.

Full SVD contains zero rows or columns in $\Sigma$ and contains no information

#### Reduced SVD

If $m>n$, $A = \hat{U}\hat{\Sigma}V^*$, $\hat{U} = (u_1, ...u_n)\in\mathbb C^{m\times n}$ with orthonormal columns, but is not square, and $\Sigma = \operatorname{diag}(\sigma_1, ...\sigma_n) \in\mathbb C^{n\times n}$. The $\hat{}$ means *reduced*.

> Here $\hat{U}^*\hat{U} = I_n$ but $\hat{U}\hat{U}^*\neq I_m$.

If $m<n$: A = $U\hat{\Sigma}\hat{V}^*$, $\hat{V} = (v_1, ...v_m)\in \mathbb C^{n\times m}$ (so that $\hat{V}^*$ is $m\times n$), $\hat{\Sigma} = \operatorname{diag}(\sigma_1, ...\sigma_n) \in\mathbb C^{m\times m}$.

**Remark**

If $A = U\Sigma V^*$, eigenvalue decomposition of $A^*A$ and $AA^*$:
$$
\begin{aligned}
A^*A = V\Sigma^\top\Sigma V^* \\
AA^* = U\Sigma\Sigma^\top U^*
\end{aligned}
$$
Thus $V$ has eigenvectors of Hermitian positive definite $A^*A$ and $U$ has eigenvectors of Hermitian positive definite $AA^*$.

$\Sigma^\top\Sigma = \Lambda_{A^*A}$ is matrix of eigenvalues of $A^*A$, $\Sigma\Sigma^\top = \Lambda_{AA^*}$.

**Remark**

Since $\rho(A^*A) = \sigma_1^2$, $\|A\|_2 = \sqrt{\rho(A^*A)} = \sigma_1$.

**Theorem 1**

Every matrix has an SVD and the singular values are uniquely determined.

*Proof in [additional notes](additional/1.28.pdf).*



### 2. Rank revealing

**Theorem 2**

Let $A\in\mathbb C^{m\times n}$ and $r$ is the number of nonzero singular values of $A$. Let $A = U\Sigma V^*$ be the SVD of $A$, then 
$$
\begin{aligned}
& \operatorname{range}(A) = \operatorname{span}\{u_1, ...u_r\}\subset \mathbb C^m \qquad \Rightarrow \qquad \operatorname{rank}A = r\\
& \operatorname{null}(A) = \operatorname{span}(v_{r+1}, ...v_n)\subset \mathbb C^n \qquad \Rightarrow \qquad \dim\operatorname{null}(A) = n-r
\end{aligned}
$$


### 3. Solving linear equation $Ax = b$ with SVD

Using $A = U\Sigma V^*$,
$$
Ax = U\Sigma V^*x = b \quad \Rightarrow \quad \Sigma V^*x = U^*b
$$
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


### 4. Other properties

1. If $A\in\mathbb C^{n\times n}$ is Hermitian, singular values are $\sigma_j = |\lambda_j|$:

$$
\Sigma^\top\Sigma = \operatorname{diag}(\sigma_1^2, ...\sigma_n^2) = \Lambda_{A^*A} = \Lambda_{A^2} = (\Lambda_A)^2 = \operatorname{diag}(\lambda_1^2, ...\lambda_n^2)
$$

2. If $A$ is Hermitian and **positive definite**, the SVD is the same as the eigenvalue decomposition, $A = U\Sigma V^* = U\Sigma U^*$. If $A$ is not positive definite, the columns of $V$ differs from $U$ by $\pm$ sign.

3. For any $A\in\mathbb C^{n\times n}$, $|\det A| = \prod_{j=1}^n\sigma_j$.



### 5. Best approximation using SVD

Let $A\in\mathbb C^{m\times n}$ with SVD $A = U\Sigma V^*$, and let $r = \operatorname{rank}A$. For any integer $\gamma$ bettween 0 and $r$, define
$$
A_\gamma = \sum_{j=1}^\gamma\sigma_ju-jv^*_j
$$
Then, 
$$
\|A-A_\gamma\|_2 = \inf_{B\in\mathbb C^{m\times n},\\\operatorname{rank} B\le\gamma}\|A - B\|_2 = \sigma_{\gamma+1}
$$


