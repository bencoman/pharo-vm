generate machine code - concretize
concretizeBrEqualRR
	| offset leftReg rightReg |
	offset := self computeJumpTargetOffsetPlus: 4.
	leftReg := operands at: 1.
	rightReg := operands at: 2.
	self machineCodeAt: 0 put: (self beqR: leftReg R: rightReg offset: offset).
	self machineCodeAt: 4 put: (self nop). "Delay slot"
	^machineCodeSize := 8