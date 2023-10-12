float ballX, ballY;
float ballSpeedX, ballSpeedY;
float leftPaddleX, leftPaddleY, rightPaddleX, rightPaddleY;
int paddleWidth = 10;
int paddleHeight = 100;
int ballSize = 20;
//bolden 
void setup() {
  size(800, 400);
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = 5; // fart
  ballSpeedY = 5; //fart
  leftPaddleX = 10; // padler størrelse
  rightPaddleX = width - paddleWidth - 10;
  leftPaddleY = rightPaddleY = (height - paddleHeight) / 2;
}

void draw() {
  background(0);

  // Opdater boldens position
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Tjek for kollision med top- og bundvæggen
  if (ballY < 0 || ballY > height) {
    ballSpeedY *= -1;
  }

  // Tjek for kollision med venstre og højre padler
  if ((ballX < leftPaddleX + paddleWidth && ballY > leftPaddleY && ballY < leftPaddleY + paddleHeight) ||
      (ballX > rightPaddleX && ballY > rightPaddleY && ballY < rightPaddleY + paddleHeight)) {
    ballSpeedX *= -1;
  }

  // Tegn bolden
  ellipse(ballX, ballY, ballSize, ballSize);

  // Tegn venstre og højre padler
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
}
