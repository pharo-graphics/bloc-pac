Class {
	#name : #BaselineOfNewBlocPac,
	#superclass : #BaselineOf,
	#category : #BaselineOfNewBlocPac
}

{ #category : #baseline }
BaselineOfNewBlocPac >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'NewBloc' with: [
				spec repository: 'github://pharo-graphics/Bloc/src' ];
			baseline: 'TaskIt' with: [
				spec repository: 'github://pharo-contributions/taskit:94-DNU-when-loading-default-group-in-Pharo-9' ].

		spec 
			package: #'BlocPac-AsyncElement' with: [
				spec requires: #(#'NewBloc' #'BlocPac-Tasker' #'BlocPac-ErrorHandling') ];
			package: #'BlocPac-ElementQuery' with: [
				spec requires: #(#'NewBloc') ];
			package: #'BlocPac-ErrorHandling' with: [
				spec requires: #(#'NewBloc') ];
			package: #'BlocPac-FocusFinder' with: [
				spec requires: #(#'NewBloc') ];
			
			package: #'BlocPac-Geometry' with: [
				spec requires: #(#'NewBloc' #'BlocPac-PullAndSlide') ];

			package: #'BlocPac-Infinite' with: [
				spec requires: #(#'NewBloc' #'BlocPac-Scrollable') ];
			package: #'BlocPac-Infinite-Layouts' with: [
				spec requires: #(#'NewBloc' #'BlocPac-Infinite') ];
			
			package: #'BlocPac-Overlay' with: [
				spec requires: #(#'NewBloc') ];

			package: #'BlocPac-PullAndSlide' with: [
				spec requires: #(#'NewBloc') ];

			package: #'BlocPac-Resizable' with: [
				spec requires: #(#'NewBloc' 'BlocPac-Overlay') ];
			package: #'BlocPac-Scalable' with: [
				spec requires: #(#'NewBloc') ];
			
			package: #'BlocPac-Scrollable' with: [
				spec requires: #(#'NewBloc' #'BlocPac-PullAndSlide') ];

			package: #'BlocPac-Tasker' with: [
				spec requires: #(#'NewBloc' #'TaskIt') ];
			
			package: #'BlocPac-Infinite' with: [
				spec requires: #(#'NewBloc') ] ].
]
