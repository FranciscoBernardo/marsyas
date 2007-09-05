######################################################################
# Automatically generated by qmake (2.01a) Fri Jul 6 16:45:56 2007
######################################################################

include ( ../Qt4Apps.pri )

marsyasQGLVIEWER {

   TEMPLATE = app
   TARGET = VauxelReality

   QT += xml opengl debug
   
	win32 {
		INCLUDEPATH += $$quote( "$$(QGLVIEWER)/QGLViewer" )	
		LIBS +=	-lQGLViewer
		CONFIG(release, debug|release) {
			LIBPATH += $$quote( \"$$(QGLVIEWER)/QGLViewer/release\" )
		}
		CONFIG(debug, debug|release) {
			LIBPATH += $$quote( \"$$(QGLVIEWER)/QGLViewer/debug\" )
		}
	}             

   unix {
      LIBPATH+= /usr/local/lib
      LIBS += -lqglviewer
      DEFINES += MARSYAS_QGLVIEWER 
      INCLUDEPATH += /usr/local/include/QGLViewer
   }
   
   MOC_DIR = .moc
   OBJECTS_DIR = .obj
   QRC_DIR = .qrc

   DEPENDPATH +=  . \
                  QGLViewers \
                  Q2DViewers \
                  Models \
                  Extractors \
                  GraphicalDataStructs \
                  QWidgets \
                  QDialogs \
                  MusicDataStructs \
                  IO
   
   INCLUDEPATH += $$DEPENDPATH
               
   # Input
   HEADERS +=  MusicCollectionIO.h iTunesXmlHandler.h iTunesXmlWriter.h \
               PlayGroupBoxW.h PlayListW.h TrackListW.h \
               iTunesPage.h PreferencesDialog.h \
               manipulatedFrameSetConstraint.h \ 
               QGLObject.h VauxelObject.h \
               AbstractMarClusteringViewer.h GlobeQGLViewer.h MetropolisQGLViewer.h \
               AbstractMarClusteringModel.h Som.h \
               AbstractMarClassifierModel.h \
               AbstractMarExtractor.h MarExtractor.h \
               VauxelRealityMainWindow.h \
               MusicTrack.h MusicCollection.h MusicLink.h
               
   SOURCES +=  MusicCollectionIO.cpp iTunesXmlHandler.cpp iTunesXmlWriter.cpp \
               PlayGroupBoxW.cpp PlayListW.cpp TrackListW.cpp \
               iTunesPage.cpp PreferencesDialog.cpp \
               manipulatedFrameSetConstraint.cpp \ 
               VauxelObject.cpp \                                  
               GlobeQGLViewer.cpp MetropolisQGLViewer.cpp \
               Som.cpp \
               MarExtractor.cpp \
               VauxelRealityMainWindow.cpp \ 
               MusicTrack.cpp MusicCollection.cpp MusicLink.cpp \
               main.cpp   
               
   RESOURCES += VauxelReality.qrc                                       
}
