int bgm_sequence = 1;

void up_sequence() {
  
  bgm_sequence ++;
  for(AudioPlayer p : players)
    p.mute();
  players.get(bgm_sequence-1).unmute();
  
}