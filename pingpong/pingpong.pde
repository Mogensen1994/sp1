float ballX, ballY;
float ballSpeedX, ballSpeedY;
float leftPaddleX, leftPaddleY, rightPaddleX, rightPaddleY;
int paddleWidth = 10;
int paddleHeight = 100;
int ballSize = 20;
PImage bg;

void setup() {
  bg = loadImage("background.jpg");
  bg.resize(width, height);
  size(800, 400);
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = 6; // fart
  ballSpeedY = 6; // fart
  leftPaddleX = 11; // padler størrelse
  rightPaddleX = width - paddleWidth - 11;
  leftPaddleY = rightPaddleY = (height - paddleHeight) / 2;
}

void draw() {
  background(bg); // tegne background ellers kommer den kun 1 gang
  println(key); // så jeg kan ser hvad jeg trykke da mit keyboard er underligt

  // Opdatere bold position
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Kollision med top- og bundvæggen
  if (ballY < 0 || ballY > height) {
    ballSpeedY *= -1;
  }

  // Kollision med venstre og højre paddel
  if ((ballX < leftPaddleX + paddleWidth && ballY > leftPaddleY && ballY < leftPaddleY + paddleHeight) ||
      (ballX > rightPaddleX && ballY > rightPaddleY && ballY < rightPaddleY + paddleHeight)) {
    ballSpeedX *= -1;
  }

  // Tegn bolden
  ellipse(ballX, ballY, ballSize, ballSize);

  // Tegn paddlerne
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);

  // Opdater venstre og højre padle position
  if (keyPressed) {
    if (key == 'w' && leftPaddleY > 0) {
      leftPaddleY -= 5;
    } else if (key == 's' && leftPaddleY + paddleHeight < height) {
      leftPaddleY += 5;
    }
    if (key == 'i' && rightPaddleY > 0) {
      rightPaddleY -= 5;
    } else if (key == 'k' && rightPaddleY + paddleHeight < height) {
      rightPaddleY += 5;
    }
  }

  // Kollision med venstre og højre vægge
  if (ballX < 0 || ballX > width) {
    // Nulstil boldens position og retning, så spillet fortsætter
    ballX = width / 2;
    ballY = height / 2;
    ballSpeedX *= -1; // Skift boldens retning
  }
}
