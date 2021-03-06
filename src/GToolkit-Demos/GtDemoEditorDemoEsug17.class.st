Class {
	#name : #GtDemoEditorDemoEsug17,
	#superclass : #Object,
	#category : 'GToolkit-Demos'
}

{ #category : #'world menu' }
GtDemoEditorDemoEsug17 class >> menuCommandOn: aBuilder [
	<worldMenu>
	
	(aBuilder item: #'Moldable Editor')
		order: 3.9;
		target: self;
		label: 'ESUG - Moldable editor';
		iconName: #catalogIcon.

	(aBuilder item: #'1. Pharo method')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorExamples exampleMethodTextOpen ].

	(aBuilder item: #'2. Two windows - one editor')
		order: 0.2;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorExamples exampleOneEditorTwoElements ].

	(aBuilder item: #'3. Documenter - Mondrian')
		order: 0.3;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(GTPlayground openContents: '''./pharo-local/iceberg/feenkcom/gtoolkit-visualizer/doc/mondrian/index.pillar'' asFileReference' label: 'Pillar')
				extent: 900@600 ].
	(aBuilder item: #'3.5. Documenter - Connector')
		order: 0.35;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(GTPlayground openContents: '''./pharo-local/iceberg/feenkcom/gtoolkit-visualizer/doc/connector/index.pillar'' asFileReference' label: 'Pillar')
				extent: 900@600 ].
			
	(aBuilder item: #'4. Class comment bloc')
		order: 0.4;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorExamples inspect ].

	(aBuilder item: #'8. Editor - lines of code')
		order: 0.8;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(GTPlayground openContents: '''Brick-Editor'' asPackage linesOfCode - BrTextEditorLineSegmentExamples linesOfCode - BrTextEditorExamples linesOfCode - BrTextEditorCommandExamples linesOfCode - BrTextEditorDemoMenu linesOfCode' label: 'Pillar')
				extent: 400@180 ].

	(aBuilder item: #'9. Layout - flow')
		order: 0.9;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlFlowLayoutExamples exampleHorizontalList ].

	(aBuilder item: #'10. Layout - floating elements')
		order: 1.0;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlFlowLayoutExamples floatingCells ].

	(aBuilder item: #'11. Layout - flow with text')
		order: 1.1;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlFlowLayoutExamples exampleText ].
		
	(aBuilder item: #'12. Focus - examples')
		order: 1.2;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			GtExampleNautilusClassMenu new examples: [ BlFocusExamples gtExamples ] withProgressCollect: [ :example | example returnValue ] ].
	
	(aBuilder item: #'13. Selection - grid')
		order: 1.3;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlSelectionExamples gridRow ].
	
	(aBuilder item: #'14. Editor - rainbow')
		order: 1.4;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BrTextEditor isDebug: true.
			BrTextEditorExamples exampleTextOpen ].
	
	(aBuilder item: #'15. Editor - grid')
		order: 1.5;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [
			BlUniverse reset.
			BrTextEditorAttributedLineSegmentHolder defaultSegmentLayout: [ BlGridLayout new columnCount: 12 ].
			BrTextEditorExamples exampleTextOpen ].
	
	(aBuilder item: #'16. Text - 10`000`000')
		order: 1.6;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [
			BlUniverse reset.
			BrTextEditorAttributedLineSegmentHolder cleanUp. BrTextEditor cleanUp.
			(BrTextEditorExamples class>>#loremIpsum) browse ].

	(aBuilder item: #'Bloc - Chicken')
		order: 2.0;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlChicken open ].

	(aBuilder item: #'Bloc - Phone')
		order: 2.1;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BlMobilePhone open ].
		
	(aBuilder item: #'Reset')
		order: 3.0;
		iconName: #catalogIcon; 
		parent: #'Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorAttributedLineSegmentHolder cleanUp. BrTextEditor cleanUp ].
]

{ #category : #'world menu' }
GtDemoEditorDemoEsug17 class >> transcriptMenuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'5. Transcript API')
		order: 0.5;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(GTPlayground openContents: '''./pharo-local/iceberg/feenkcom/gtoolkit/doc/transcript/index.pillar'' asFileReference' label: 'Pillar')
				extent: 900@600 ].
		
	(aBuilder item: #'6. Transcript - Object shower')
		order: 0.6;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(Smalltalk tools inspector openOn: (GtTranscriptExamples new objectShower)) extent: 400@600 ].
		
	(aBuilder item: #'7. Transcript - Element animation')
		order: 0.7;
		iconName: #catalogIcon;
		parent: #'Moldable Editor';
		action: [ BlUniverse reset.
			(Smalltalk tools inspector openOn: (GtTranscriptExamples new transcriptWitAnimation)) extent: 400@600 ].
]
