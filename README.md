# Prayer Cards - Static Website

A simple, static website for displaying prayer cards with flip animations. Each card has a front (image) and back (text) that users can flip between.

## Structure

```
prayer-cards/
├── index.html              # Main page with list of all cards
├── README.md               # This file
├── css/
│   └── styles.css         # All styles and animations
├── cards/
│   ├── act-of-contrition.html
│   ├── alma-redemptoris-mater.html
│   └── ...                # One HTML file per card
└── images/
    └── ...                # Card images (optional)
```

## Features

- **Pure HTML/CSS/JS**: No build process or dependencies needed
- **Bookmarkable URLs**: Each card has its own URL
- **Flip Animation**: CSS 3D transforms for smooth card flipping
- **Responsive**: Works on mobile and desktop
- **No Backend**: Completely static, can be hosted anywhere

## How It Works

### Index Page (index.html)
- Lists all cards in a grid
- Each card links to its own page

### Card Pages (cards/*.html)
- Each card is a separate HTML file
- Front shows an image
- Back shows descriptive text
- Click card or button to flip
- "Back to Index" link returns to main page

### Styling (css/styles.css)
- Gradient background
- Card flip animation using CSS 3D transforms
- Hover effects on index cards
- Responsive grid layout

## Adding New Cards

Contributions are welcome via pull request.

1. **Create a new HTML file** in `cards/` (e.g., `cards/my-card.html`)
2. **Add a web-optimized image**, preferably a webp as close as possible to 600px x 400px
3. **Copy an existing card** as a template
4. **Update the content**:
   - Change the title
   - Update the image src
   - Modify the back text
5. **Add to index.html**:
   ```html
   <a href="cards/my-card.html" class="card-link">
       <div class="card-preview">
           <img src="images/new-image.webp" alt="description of the image" class="card-image">
           <h2>My Card Title</h2>
       </div>
   </a>
   ```

## Adding Images

1. All images must be public domain or otherwise properly licensed
2. Place images in the `images/` directory
3. Reference them in card HTML: `<img src="../images/my-image.jpg" ...>`
4. Update the `info-content` div with a description of the image, attribution, a link to the original source, and license info.

## Hosting

The site is hosted using GitHub Pages at <a href="https://prayercards.online">https://prayercards.online</a>. Anything merged to `main` is automatically deployed.

## License

Use freely for personal or commercial projects.
