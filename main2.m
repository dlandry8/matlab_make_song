%--------------------------------------------------------------------------
%   main2
%   This is version 2 of Lab 1: Elementary Music Synthesis.
%   This version takes in a sequence of notes and plays them.
%   It utilizes an ADSR to control the volume, allowing for a smoother
%   progression of notes.
%   Team members: David Landry and Biniyam Yemane
%--------------------------------------------------------------------------
function main2
	% The notes vector is the collection of notes to be played for the
	% current song.
	notes = ['A' 'A' 'E' 'E' 'E' 'B' 'C' 'B' 'A'];

	% noteLength is a parallel vector to notes, indicating the length of each
	% of the notes to be played.
	noteLength = [2, 1, 1, 1, 1, 1, 1, 1, 4];

	% samplingFrequency is set at 8000S/s:
	samplingFrequency = 8000;

	% Declare the running song vector.
	song = [];

	% Set up each note:
	for i = 1:length(notes)
		switch(notes(i))
			% The switch statement assigns a frequency to the current note.
			case 'A'
				freq = 220*2^(0/12);
			case 'B'
				freq = 220*2^(2/12);
			case 'C'
				freq = 220*2^(3/12);
			case 'D'
				freq = 220*2^(5/12);
			case 'E'
				freq = 220*2^(7/12);
			case 'F'
				freq = 220*2^(8/12);
			case 'G'
				freq = 220*2^(10/12);
		end
		
		% The n vector is an index count.
		n = 0:(noteLength(i)*samplingFrequency/2)-1;
		
		% currentNote forms the note vector for the current note.
		currentNote = cos(2*pi*freq/samplingFrequency*n);
		
		% ADSR is the magnitude multiplier for currentNote to make it sound
		% smoother.
		ADSR = [linspace(0,1,.05*length(n)) linspace(1,.8,.1*length(n)) ...
			linspace(.8,.8,.7*length(n)) linspace(0.8,0,.15*length(n))];
		
		% We ran into an issue multiplying currentNote by ADSR since they are
		% both row matrices. Therefore, we appended the song vector one index 
		% at a time for the current note:
		for j=1:length(n)
			song = [song, currentNote(j)*ADSR(j)];
		end
	end

	% Play the song once it has been fully assembled.
	soundsc(song);
end


%--------------------------------------------------------------------------
%   Function:       makeSong
%   Description:    Forms a song with the input notes and note lengths.
%   Input:          notes: A character vector of notes: A-G
%                   noteLength: A vector of note lengths:
%                       1:  quarter note
%                       2:  half note
%                       4:  full note
%                   samplingFrequency: The desired sampling frequency.
%   Output:         song: The song formed from the notes & lengths.
%   Team members:   David Landry and Biniyam Yemane
%--------------------------------------------------------------------------
function [song] = makeSong(notes, noteLength, samplingFrequency)
	% Declare the running song vector.
	song = [];

	% Set up each note:
	for i = 1:length(notes)
		switch(notes(i))
			% The switch statement assigns a frequency to the current note.
			case 'A'
				freq = 220*2^(0/12);
			case 'B'
				freq = 220*2^(2/12);
			case 'C'
				freq = 220*2^(3/12);
			case 'D'
				freq = 220*2^(5/12);
			case 'E'
				freq = 220*2^(7/12);
			case 'F'
				freq = 220*2^(8/12);
			case 'G'
				freq = 220*2^(10/12);
		end
		
		% The n vector is an index count.
		n = 0:(noteLength(i)*samplingFrequency/2)-1;
		
		% currentNote forms the note vector for the current note.
		currentNote = cos(2*pi*freq/samplingFrequency*n);
		
		% ADSR is the magnitude multiplier for currentNote to make it sound
		% smoother.
		ADSR = [linspace(0,1,.05*length(n)) ... 
			linspace(1,.8,.1*length(n)) ...
			linspace(.8,.8,.7*length(n)) ...   
			linspace(0.8,0,.15*length(n))];     
		
		% We ran into an issue multiplying currentNote by ADSR since they are
		% both row matrices. Therefore, we appended the song vector one index 
		% at a time for the current note:
		thisNote = []
		for j=1:length(n)
			song = [song, currentNote(j)*ADSR(j)];
			%thisNote = [thisNote, currentNote(j)*ADSR(j)];
		end
		%thisNote = [thisNote, zeros(1, 16000-length(n))];
		%song = [song;thisNote]; 
	end
end