.section .note.GNU-stack
.intel_syntax noprefix

.global vec3_add
.global vec3_sub

.global vec3_mul
.global vec3_div

.global vec3_magnitude2
.global vec3_magnitude
.global vec3_magnitude_approx
.global vec3_normalized_approx

.global vec3_dot
.global vec3_cross

.text

vec3_add:
	addps xmm0, xmm1
	ret

vec3_sub:
	subps xmm0, xmm1
	ret

vec3_mul:
	shufps xmm1, xmm1, 0
	mulps xmm0, xmm1
	ret

vec3_div:
	shufps xmm1, xmm1, 0
	divps xmm0, xmm1
	ret

vec3_magnitude2:
	mulps xmm0, xmm0
	movaps xmm1, xmm0
	movaps xmm2, xmm0
	psrldq xmm1, 4
	psrldq xmm2, 8
	addps  xmm0, xmm1
	addps  xmm0, xmm2
	ret

vec3_magnitude:
	movaps xmm1, xmm0
	mulps xmm1, xmm1
	movaps xmm2, xmm1
	movaps xmm3, xmm1
	psrldq xmm2, 4
	psrldq xmm3, 8
	addps  xmm1, xmm2
	addps  xmm1, xmm3

	sqrtss xmm0, xmm0
	
	ret

vec3_magnitude_approx:
	movaps xmm1, xmm0
	mulps xmm1, xmm1
	movaps xmm2, xmm1
	movaps xmm3, xmm1
	psrldq xmm2, 4
	psrldq xmm3, 8
	addps  xmm1, xmm2
	addps  xmm1, xmm3

	rsqrtss xmm0, xmm0
	rcpss xmm0, xmm0
	
	ret

vec3_normalized_approx:
	movaps xmm1, xmm0
	mulps xmm1, xmm1
	movaps xmm2, xmm1
	movaps xmm3, xmm1
	psrldq xmm2, 4
	psrldq xmm3, 8
	addps  xmm1, xmm2
	addps  xmm1, xmm3

	rsqrtss xmm1, xmm1
	shufps xmm1, xmm1, 0
	mulps xmm0, xmm1

	ret

vec3_dot:
	mulps  xmm0, xmm1

	movaps xmm1, xmm0
	movaps xmm2, xmm0
	psrldq xmm1, 4
	psrldq xmm2, 8

	addss  xmm0, xmm1
	addss  xmm0, xmm2
	
	ret

vec3_cross:
	movaps xmm2, xmm0
	movaps xmm3, xmm1

	shufps xmm0, xmm0, 0b11001001
	shufps xmm1, xmm1, 0b11010010
	shufps xmm2, xmm2, 0b11010010
	shufps xmm3, xmm3, 0b11001001

	mulps xmm0, xmm1
	mulps xmm2, xmm3

	subps xmm0, xmm2

	ret
