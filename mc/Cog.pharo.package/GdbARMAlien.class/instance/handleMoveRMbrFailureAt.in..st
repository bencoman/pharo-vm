error handling
handleMoveRMbrFailureAt: pc "<Integer>" in: memoryArray "<Bitmap|ByteArray>"
	"Convert an execution primitive failure for a byte register write into a ProcessorSimulationTrap signal."
	"generated by MoveRMbr"

	"might be strb destReg, [srcReg, #immediate] or strb destReg, [srcReg, RISCTempReg] "

	"first test for ldrb destReg, [srcReg, RISCTempReg]
	-test for 0xE7CX as the most significant three nibbles"
	((memoryArray byteAt: pc + 4) = 16rE7 and: [(memoryArray byteAt: pc + 3) >> 4 = 16rC])
		ifTrue: [(ProcessorSimulationTrap
				pc: pc
				nextpc: pc + 4
				address: (memoryArray byteAt: pc - 3)
						+ ((memoryArray byteAt: pc - 7)
								<< 8) + ((memoryArray byteAt: pc - 11)
							<< 16) + ((memoryArray byteAt: pc - 15)
							<< 24)
				type: #write
				accessor: ("work out the dest register name"self registerStateNames at: (memoryArray byteAt: pc + 2) >> 4 + 1)) signal
]
		ifFalse:
			[self reportPrimitiveFailure]