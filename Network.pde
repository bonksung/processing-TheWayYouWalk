void webSocketServerEvent(String msg){
  println(msg);
  if(msg.equals("A")) {
    for(Flower f : flowers)
      f.origposition.set(0, height/2);    
  }
  if(msg.equals("B")) {
    for(Flower f : flowers)
      f.origposition.set(width, height/2); 
  }
  if(msg.equals("C")) {
    for(Flower f : flowers)
      f.origposition.set(0, height); 
  }
  if(msg.equals("D")) {
    for(Flower f : flowers)
      f.origposition.set(width, height); 
  }
  if(msg.equals("E")) {
    for(Flower f : flowers) {
      f.origposition.set(width/2, height/4*3);
      f.disappear = true;
    }
  }
  if(msg.contains("angle")) {
    angle = int(msg.split(":")[1]);
  }
  if(msg.contains("click")) {
    You you = new You(width/2, height*3/4, angle);
    yous.add(you);  
  }
}