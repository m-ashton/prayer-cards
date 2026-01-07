class Carousel {
    constructor() {
        this.carousel = document.querySelector('.carousel');
        this.track = document.querySelector('.carousel-track');
        this.cards = Array.from(document.querySelectorAll('.card-link'));
        this.prevBtn = document.querySelector('.carousel-btn.prev');
        this.nextBtn = document.querySelector('.carousel-btn.next');
        this.indicators = document.querySelector('.carousel-indicators');

        this.currentIndex = 0;
        this.isDragging = false;
        this.startPos = 0;
        this.currentTranslate = 0;
        this.prevTranslate = 0;
        this.animationID = null;

        this.init();
    }

    init() {
        this.createIndicators();
        this.updateIndicators();
        this.attachEventListeners();
        this.updateButtons();
    }

    createIndicators() {
        this.cards.forEach((_, index) => {
            const dot = document.createElement('div');
            dot.classList.add('carousel-indicator');
            if (index === 0) dot.classList.add('active');
            dot.addEventListener('click', () => this.goToSlide(index));
            this.indicators.appendChild(dot);
        });
    }

    updateIndicators() {
        const dots = this.indicators.querySelectorAll('.carousel-indicator');
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === this.currentIndex);
        });
    }

    attachEventListeners() {
        // Mouse events
        this.track.addEventListener('mousedown', this.touchStart.bind(this));
        this.track.addEventListener('mousemove', this.touchMove.bind(this));
        this.track.addEventListener('mouseup', this.touchEnd.bind(this));
        this.track.addEventListener('mouseleave', this.touchEnd.bind(this));

        // Touch events
        this.track.addEventListener('touchstart', this.touchStart.bind(this));
        this.track.addEventListener('touchmove', this.touchMove.bind(this));
        this.track.addEventListener('touchend', this.touchEnd.bind(this));

        // Button events
        this.prevBtn.addEventListener('click', () => this.prev());
        this.nextBtn.addEventListener('click', () => this.next());

        // Prevent context menu on long press
        this.track.addEventListener('contextmenu', (e) => {
            if (this.isDragging) e.preventDefault();
        });

        // Prevent image dragging
        this.cards.forEach(card => {
            card.addEventListener('dragstart', (e) => e.preventDefault());
        });
    }

    getPositionX(event) {
        return event.type.includes('mouse') ? event.pageX : event.touches[0].clientX;
    }

    touchStart(event) {
        this.isDragging = true;
        this.startPos = this.getPositionX(event);
        this.animationID = requestAnimationFrame(this.animation.bind(this));
        this.track.style.cursor = 'grabbing';
    }

    touchMove(event) {
        if (!this.isDragging) return;

        const currentPosition = this.getPositionX(event);
        const diff = currentPosition - this.startPos;
        this.currentTranslate = this.prevTranslate + diff;
    }

    touchEnd() {
        if (!this.isDragging) return;

        this.isDragging = false;
        cancelAnimationFrame(this.animationID);

        const movedBy = this.currentTranslate - this.prevTranslate;

        // If moved enough, go to next/prev slide
        if (movedBy < -100 && this.currentIndex < this.cards.length - 1) {
            this.currentIndex++;
        } else if (movedBy > 100 && this.currentIndex > 0) {
            this.currentIndex--;
        }

        this.setPositionByIndex();
        this.track.style.cursor = 'grab';
    }

    animation() {
        this.setSliderPosition();
        if (this.isDragging) {
            requestAnimationFrame(this.animation.bind(this));
        }
    }

    setSliderPosition() {
        this.track.style.transform = `translateX(${this.currentTranslate}px)`;
    }

    setPositionByIndex() {
        const cardWidth = this.cards[0].offsetWidth;
        const gap = 20; // Match the gap in CSS
        const containerWidth = this.carousel.offsetWidth;
        const offset = (containerWidth - cardWidth) / 2;

        this.currentTranslate = -this.currentIndex * (cardWidth + gap) + offset;
        this.prevTranslate = this.currentTranslate;
        this.setSliderPosition();
        this.updateIndicators();
        this.updateButtons();
    }

    goToSlide(index) {
        this.currentIndex = index;
        this.setPositionByIndex();
    }

    next() {
        if (this.currentIndex < this.cards.length - 1) {
            this.currentIndex++;
            this.setPositionByIndex();
        }
    }

    prev() {
        if (this.currentIndex > 0) {
            this.currentIndex--;
            this.setPositionByIndex();
        }
    }

    updateButtons() {
        this.prevBtn.disabled = this.currentIndex === 0;
        this.nextBtn.disabled = this.currentIndex === this.cards.length - 1;
    }
}

// Initialize carousel when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new Carousel();

    // Update carousel position on window resize
    let resizeTimer;
    window.addEventListener('resize', () => {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(() => {
            const carousel = new Carousel();
            carousel.setPositionByIndex();
        }, 250);
    });
});
