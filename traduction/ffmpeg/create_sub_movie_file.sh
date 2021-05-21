#!/bin/bash
##
## 


SRT_FILE="$1"
TIME="$2"


function allocate_time 
{
	ffmpeg -f lavfi -i color=size=1920x200:rate=30:color=0x0000FF00 -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -t "$2"  -pix_fmt yuv420p "$1".mp4
}

function integrate_sub
{
	ffmpeg -i "$1".mp4 -lavfi "subtitles=$1:force_style='Fontname=Avenir Light, Alignment=10,Fontsize=128'" -crf 1 -c:a copy "$1""_sub.mp4"
}

function cleanup
{
	rm "$1".mp4
}

allocate_time $SRT_FILE $TIME
integrate_sub $SRT_FILE
cleanup $SRT_FILE


		


