/* script.js */
const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const scoreDisplay = document.getElementById('score');
const startButton = document.getElementById('startButton');

const gridSize = 20;
let snake = [{ x: 10, y: 10 }];
let food = {};
let direction = 'right';
let changingDirection = false;
let score = 0;
let gameInterval;
let gameSpeed = 100; // milliseconds

// Initialize game on start button click
startButton.addEventListener('click', startGame);

function startGame() {
    resetGame();
    generateFood();
    startButton.disabled = true;
    gameInterval = setInterval(gameLoop, gameSpeed);
}

function resetGame() {
    snake = [{ x: 10, y: 10 }];
    direction = 'right';
    score = 0;
    scoreDisplay.textContent = score;
    clearInterval(gameInterval);
    draw(); // Draw initial state
}

function generateFood() {
    food = {
        x: Math.floor(Math.random() * (canvas.width / gridSize)),
        y: Math.floor(Math.random() * (canvas.height / gridSize))
    };
    // Ensure food doesn't spawn on the snake
    while (snake.some(segment => segment.x === food.x && segment.y === food.y)) {
        food = {
            x: Math.floor(Math.random() * (canvas.width / gridSize)),
            y: Math.floor(Math.random() * (canvas.height / gridSize))
        };
    }
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Draw snake
    snake.forEach(segment => {
        ctx.fillStyle = 'lightgreen';
        ctx.strokeStyle = 'darkgreen';
        ctx.fillRect(segment.x * gridSize, segment.y * gridSize, gridSize, gridSize);
        ctx.strokeRect(segment.x * gridSize, segment.y * gridSize, gridSize, gridSize);
    });

    // Draw food
    ctx.fillStyle = 'red';
    ctx.strokeStyle = 'darkred';
    ctx.fillRect(food.x * gridSize, food.y * gridSize, gridSize, gridSize);
    ctx.strokeRect(food.x * gridSize, food.y * gridSize, gridSize, gridSize);
}

function moveSnake() {
    if (changingDirection) return; // Prevent rapid direction changes
    const head = { x: snake[0].x, y: snake[0].y };

    switch (direction) {
        case 'up':
            head.y--;
            break;
        case 'down':
            head.y++;
            break;
        case 'left':
            head.x--;
            break;
        case 'right':
            head.x++;
            break;
    }

    snake.unshift(head); // Add new head

    // Check for food collision
    const didEatFood = head.x === food.x && head.y === food.y;
    if (didEatFood) {
        score += 10;
        scoreDisplay.textContent = score;
        generateFood();
        // Increase speed slightly
        clearInterval(gameInterval);
        gameSpeed = Math.max(50, gameSpeed - 5); // Minimum speed of 50ms
        gameInterval = setInterval(gameLoop, gameSpeed);
    } else {
        snake.pop(); // Remove tail if no food eaten
    }
    changingDirection = true; // Allow direction change after a move
}

function checkCollision() {
    const head = snake[0];

    // Wall collision
    const hitLeftWall = head.x < 0;
    const hitRightWall = head.x >= canvas.width / gridSize;
    const hitTopWall = head.y < 0;
    const hitBottomWall = head.y >= canvas.height / gridSize;

    if (hitLeftWall || hitRightWall || hitTopWall || hitBottomWall) {
        return true;
    }

    // Self-collision (start checking from the 4th segment to avoid immediate collision)
    for (let i = 4; i < snake.length; i++) {
        if (head.x === snake[i].x && head.y === snake[i].y) {
            return true;
        }
    }
    return false;
}

function gameLoop() {
    changingDirection = false; // Reset flag for new move
    if (checkCollision()) {
        clearInterval(gameInterval);
        alert(`Game Over! Your score: ${score}`);
        startButton.disabled = false;
        return;
    }
    moveSnake();
    draw();
}

document.addEventListener('keydown', e => {
    const keyPressed = e.key;
    const goingUp = direction === 'up';
    const goingDown = direction === 'down';
    const goingLeft = direction === 'left';
    const goingRight = direction === 'right';

    if (keyPressed === 'ArrowLeft' && !goingRight) {
        direction = 'left';
    } else if (keyPressed === 'ArrowUp' && !goingDown) {
        direction = 'up';
    } else if (keyPressed === 'ArrowRight' && !goingLeft) {
        direction = 'right';
    } else if (keyPressed === 'ArrowDown' && !goingUp) {
        direction = 'down';
    }
});

// Initial draw before game starts
draw();