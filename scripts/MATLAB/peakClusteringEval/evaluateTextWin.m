
resynthFramesCount = resynthFramesCount + 1;

%check if we already resynthesized a complete texture window
if resynthFramesCount == refFramesCount
    %get the last audio frame
    resynthAudio = [resynthAudio, PlotSink_send2MATLAB_indata];
    
    %get reference audio for current texture window
    %(ignore mix track, i.e. 1st row)
    refAudio = audio(2:end,textWinStart:textWinEnd);
    
    %make sure both audio vectors have the same length (PHASE PROBLEMS?!?! ASK MAT...)
    audioLen = min(size(refAudio,2), size(resynthAudio,2));
    refAudio = refAudio(:,1:audioLen);
    %only take the first numActiveNotes columns 
    resynthAudio = resynthAudio(1:numActiveNotes,1:audioLen);
        
    %compute SDR for current texture window
    %SDRresults = computeSDR(refAudio, resynthAudio); %%%%%%%%%%%%%%%%%%%%%%
    
    %store results for entire file
    refAudioTextWinds = [refAudioTextWinds, refAudio];
    resynthAudioTextWinds = [resynthAudioTextWinds, resynthAudio];
    %SDRTextWinds = [SDRTextWinds, SDRresults]; %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    % init vars for next texture window
    numActiveNotes = 0;
    refFramesCount = 0;
    resynthFramesCount = 0;
    resynthAudio = [];   
else 
    %keep accumulating resynthesized audio frame from PlotSink MarSystem.
    %each row has the audio from each cluster 
    %(i.e. only the first numActiveNotes rows contain audio... the others
    %should be silence).
    resynthAudio = [resynthAudio, PlotSink_send2MATLAB_indata];
end




