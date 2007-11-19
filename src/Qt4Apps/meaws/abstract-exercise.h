#ifndef MEAWS_EXERCISE_ABSTRACT_H
#define MEAWS_EXERCISE_ABSTRACT_H

#include "defs.h"
#include <QObject>
#include <QString>
#include <QLabel>
#include "abstract-try.h"


class Exercise : public QObject
{
	Q_OBJECT

public:
	Exercise();
	virtual ~Exercise();
	virtual void setupDisplay(QLayout* centralLayout);

	virtual void open(QString exerciseFilename);
	virtual QString exercisesDir() = 0;
	virtual int getBackend() = 0;
	virtual QString getMessage() = 0;
	virtual bool displayAnalysis(MarBackend *results) = 0;

	virtual void addTry() = 0;
	void addTryAbstract(Try* newTry);
	virtual void delTry() = 0;
	void delTryAbstract();

signals:
	void analysisDone();
	void newTry();

protected slots:
	virtual void selectTry(mrs_natural selected);

protected:
    QFrame *instructionArea_;
    QFrame *resultArea_;

	QLayout *instructionLayout_;
	QLabel *instructionImageLabel_;

	QLayout *resultLayout_;

	QList<Try *> *tries_;
	mrs_natural currentTryNumber_;
		// this only points to
		// tries[currentTryNumber_].  Do not delete this!
	Try* currentTry_;


	// TODO: figure out how to find the height_.  :(
	int height_;
};
#endif

