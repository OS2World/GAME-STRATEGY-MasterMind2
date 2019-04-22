#include <stdio.h>
#include <audio.h>

VOID DetectAudioDevice(VOID);
VOID PrintVersion(VOID);
VOID PlayWaveform(LPAUDIOWAVE lpWave);


int main(int argc, char *argv[])
{
   UINT rc;
   AUDIOCAPS caps;
   UINT nDeviceId;
   AUDIOINFO info;
   LPAUDIOWAVE lpWave;

   /* Initialize audio library */
   rc = AInitialize();
   if (rc != 0) {
      printf("Audio-Initialisierung fehlgeschagen!\n");
      exit();
   }
   PrintVersion();
   printf("\n\n");
   printf("Es sind %d Audio-Interfaces installiert.\n", AGetAudioNumDevs());

   /* show all the installed device drivers */
   for (nDeviceId = 0; nDeviceId < AGetAudioNumDevs(); nDeviceId++) {
      AGetAudioDevCaps(nDeviceId, &caps);
      printf("nDeviceId=%d wProductId=%d szProductName=%s\n", nDeviceId, caps.wProductId, caps.szProductName);
   }
   printf("\n\n");
   DetectAudioDevice();

   /* open audio device */
   info.nDeviceId = AUDIO_DEVICE_MAPPER;
   info.wFormat = AUDIO_FORMAT_16BITS | AUDIO_FORMAT_STEREO;
   info.nSampleRate = 44100;
   AOpenAudio(&info);

   /* load waveform file */
   ALoadWaveFile(argv[1], &lpWave, 0);

   AOpenVoices(1);
   PlayWaveform(lpWave);
   ACloseVoices();


   rc = ACloseAudio();
   if (rc != 0) {
      printf("Schlieáen des Audio-Device fehlgeschagen!\n");
      exit();
   }
   exit();
}


VOID DetectAudioDevice(VOID)
{
   AUDIOCAPS caps;
   UINT nDeviceId;

   if (APingAudio(&nDeviceId) != AUDIO_ERROR_NONE) {
      printf("no audio device found.\n");
   }
   else {
      AGetAudioDevCaps(nDeviceId, &caps);
      printf("%s device found.\n", caps.szProductName);
   }
}

VOID PrintVersion(VOID)
{
   UINT rc;

   rc = AGetVersion();
   printf("Es ist Version %d.%2.2d der Audio-Library installiert.\n", rc>>8, rc&255);
}

VOID PlayWaveform(LPAUDIOWAVE lpWave)
{
   HAC hVoice;
   BOOL stopped;

   /* allocate an audio voice or channel */
   if (ACreateAudioVoice(&hVoice) == AUDIO_ERROR_NONE) {
      /* play the waveform through the voice */
      APlayVoice(hVoice, lpWave);
      ASetVoiceVolume(hVoice, 64);
      ASetVoicePanning(hVoice, 128);
      /* wait until the wave finishes or a key is pressed */
      while (!0) {
         AUpdateAudio();
         AGetVoiceStatus(hVoice, &stopped);
         if (stopped) break;
      }
      /* stop the voice (if already playing) */
      AStopVoice(hVoice);
      /* release the allocated voice */
      ADestroyAudioVoice(hVoice);
   }
}
