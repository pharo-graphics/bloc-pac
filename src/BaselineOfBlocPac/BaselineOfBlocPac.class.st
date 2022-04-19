Class {
	#name : #BaselineOfBlocPac,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocPac
}

{ #category : #baseline }
BaselineOfBlocPac >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Bloc' with: [
				spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ];
			baseline: 'TaskIt' with: [
				spec repository: 'github://pharo-contributions/taskit' ];
			baseline: 'XMLParser' with: [
				spec
					repository: 'github://pharo-contributions/XML-XMLParser';
					loads: #(Core) ].

		spec 
			package: #'BlocPac-AsyncElement' with: [
				spec requires: #(#'Bloc' #'BlocPac-Tasker' #'BlocPac-ErrorHandling') ];
			package: #'BlocPac-ElementQuery' with: [
				spec requires: #(#'Bloc') ];
			package: #'BlocPac-ErrorHandling' with: [
				spec requires: #(#'Bloc') ];
			package: #'BlocPac-FocusFinder' with: [
				spec requires: #(#'Bloc') ];
			
			package: #'BlocPac-Geometry' with: [
				spec requires: #(#'Bloc' #'BlocPac-PullAndSlide') ];

			package: #'BlocPac-Infinite' with: [
				spec requires: #(#'Bloc' #'BlocPac-Scrollable') ];
			package: #'BlocPac-Infinite-Layouts' with: [
				spec requires: #(#'Bloc' #'BlocPac-Infinite') ];
			
			package: #'BlocPac-Overlay' with: [
				spec requires: #(#'Bloc') ];

			package: #'BlocPac-PullAndSlide' with: [
				spec requires: #(#'Bloc') ];

			package: #'BlocPac-Resizable' with: [
				spec requires: #(#'Bloc' 'BlocPac-Overlay') ];
			package: #'BlocPac-Scalable' with: [
				spec requires: #(#'Bloc') ];
			
			package: #'BlocPac-Scrollable' with: [
				spec requires: #(#'Bloc' #'BlocPac-PullAndSlide') ];

			package: #'BlocPac-Tasker' with: [
				spec requires: #(#'Bloc' #'TaskIt') ];
			
			package: #'BlocPac-SVG' with: [
				spec requires: #(#'Bloc' #'XMLParser') ];
			package: #'BlocPac-SVG-Tests' with: [
				spec requires: #(#'BlocPac-SVG') ]

			 ].
]
