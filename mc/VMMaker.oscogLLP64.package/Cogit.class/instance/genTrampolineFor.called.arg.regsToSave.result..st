initialization
genTrampolineFor: aRoutine called: aString arg: regOrConst0 regsToSave: regMask result: resultReg
	"Generate a trampoline with one argument that answers a result.
	 Hack: a negative value indicates an abstract register, a non-negative value indicates a constant."
	<var: #aRoutine type: #'void *'>
	<var: #aString type: #'char *'>
	^self
		genTrampolineFor: aRoutine
		called: aString
		numArgs: 1
		arg: regOrConst0
		arg: nil
		arg: nil
		arg: nil
		regsToSave: regMask
		pushLinkReg: true
		resultReg: resultReg
		appendOpcodes: false