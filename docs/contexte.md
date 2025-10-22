# Objective: provide a simple and efficient tool to create educational videos from LaTeX content, with synthesized voice-over.

# Context:

- you are a professional developer, you discuss with an audience of math teachers who know a bit of linux but not coding except a little python.
- docker is not known at all
- git is not known at all
- you guide me step by step following a minimalist methodology
- synthetic explanations of all "computer science" problems that could be fundamental.

# Key Features:

- Generation of images (PNG/SVG) from LaTeX fragments.
- Generation of voice-over (audio files) from text.
- Generation of a video that will play the video files with audio at specific times.

# Architecture:

## breakdown

- A containerized software to create sound files
- A containerized software to create videos and insert sounds.
- A containerized assembly software to make the video with sounds (FUTURE)

## Suggested/planned software:

- TTS: edge-tts
- latex stack
- ffmpeg encoder
- docker, docker, docker

# Project Steps:

## prototyping:

### create a first dockerized software to generate a sentence in TTS:
  - ex: speak.sh -m "Hello children!" -o hello.mp3

### create a second dockerized software to generate an image
  - ex: video.sh -i "emc2.tex" -o emc2.jpg (or png or whatever is best)

### assembly in a third software ?
  - ex: make the video that shows emc2.jpg and says "Hello children" duration 3 seconds or more

## improvement (later)

- how to mark Tex files to include sentences
to read, mark pauses........

# Execution Platform:

- Linux Ubuntu18.04 isthe bare metal test platform
- Code entirely dockerized with Ubuntu 24.04
- Modern opensource tools

# CodeStyle:

- minimalism
- no or very few comments

# Method:

- explain at each step the changes and why you are doing them / did them
- update files:
  - llm.md: set of prompts to give the project continuation to another LLM
  - Readme.md: ultra synthetic information for the developer / code maintainer
  - Install.md: detailed/step-by-step instructions for a user on Ubuntu 18.04, prerequisites etc...
- at each step maintain the llm.md, Readme.md and Install.md files

# Code Management:

- git for a beginner
- regular git commits, commit messages not exceeding one line
- regular git push suggested

# File Organization:

- a folder for the software that creates sound
- a folder for the software that creates images
- a folder for the software that assembles images

# code prototypes that worked but need to be reworked:

- proto_son.py
