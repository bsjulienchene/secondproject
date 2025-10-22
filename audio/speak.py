#!/usr/bin/env python3
"""
Simple wrapper around edge-tts to produce a WAV file from text.
Requires `edge-tts` package and internet access.
"""

import argparse
import asyncio
from pathlib import Path


async def synth(text: str, out_path: str, voice: str = "fr-FR-HenriNeural"):
    try:
        from edge_tts import Communicate
    except Exception:
        raise RuntimeError('edge-tts is not installed')

    communicate = Communicate(text, voice)
    await communicate.save(out_path)


def main():
    p = argparse.ArgumentParser(description='Synthesize text to audio using edge-tts')
    p.add_argument('-t', '--text', required=True, help='Text to synthesize')
    p.add_argument('-o', '--out', required=True, help='Output audio file (mp3 format)')
    p.add_argument('--voice', default='fr-FR-HenriNeural', help='Voice id (default: fr-FR-HenriNeural)')
    args = p.parse_args()

    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)

    try:
        asyncio.run(synth(args.text, str(out), args.voice))
        print(f'Generated {out} using edge-tts (voice={args.voice})')
    except Exception as e:
        print('edge-tts synthesis failed:', e)
        raise


if __name__ == '__main__':
    main()
