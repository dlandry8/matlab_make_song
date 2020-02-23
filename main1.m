%--------------------------------------------------------------------------
%   main1
%   This is version 1 of Lab 1: Elementary Music Synthesis.
%   This version takes in a sequence of notes and plays them.
%   The notes are separated by a brief pause.
%   Team members: David Landry and Biniyam Yemane
%--------------------------------------------------------------------------
function main1
	% The variable "notes" may be modified to change the notes of the song.
	notes = ['A' 'A' 'E' 'E' 'E' 'B' 'C' 'B' 'A'];

	% The variable "noteLength" is a parallel array of note lengths. Its length
	% must match the variable "notes"
	noteLength = [2, 1, 1, 1, 1, 1, 1, 1, 4];

	% "samplingFrequency" is the sampling frequency. Default is 8000 samples
	% per second.
	samplingFrequency = 8000;

	% "pause" is the length of pause between notes.
	pause = 0.0625*samplingFrequency;

	% The song is constructed below.
	song = [];
	for i = 1:length(notes)
		switch(notes(i))
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
		n = 0:(noteLength(i)*samplingFrequency/2)-1;
		song = [song, cos(2*pi*freq/samplingFrequency*n), zeros(1,pause)];
	end

	% Play the song:
	soundsc(song);
end