gc - global
followRememberedForwardersAndForgetFreeObjectsForPigCompact
	"Scan the remembered set. Follow any forwarded objects,
	 and remove free objects.  This is for global scan-mark GC."
	| index obj |
	index := 0.
	[index < rememberedSetSize] whileTrue:
		[obj := rememberedSet at: index.
		 (manager isFreeObject: obj) "free; remove by overwriting with last element"
			ifTrue:
				[rememberedSetSize := rememberedSetSize - 1.
				 rememberedSet at: index put: (rememberedSet at: rememberedSetSize)]
			ifFalse:
				[(manager isForwarded: obj) ifTrue:
					[manager setIsRememberedOf: obj to: false.
					 obj := manager followForwarded: obj.
					 self assert: (manager isRemembered: obj).
					 rememberedSet at: index put: obj].
				 index := index + 1]]