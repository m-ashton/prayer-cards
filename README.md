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
│   ├── sacred-cross.html
│   ├── sacred-heart.html
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
- Uses emoji icons as fallback if images aren't available

### Card Pages (cards/*.html)
- Each card is a separate HTML file
- Front shows an image (with emoji fallback)
- Back shows descriptive text
- Click card or button to flip
- "Back to Index" link returns to main page

### Styling (css/styles.css)
- Gradient background
- Card flip animation using CSS 3D transforms
- Hover effects on index cards
- Responsive grid layout

## Adding New Cards

1. **Create a new HTML file** in `cards/` (e.g., `cards/my-card.html`)
2. **Copy an existing card** as a template
3. **Update the content**:
   - Change the title
   - Update the image src (or keep emoji fallback)
   - Modify the back text
4. **Add to index.html**:
   ```html
   <a href="cards/my-card.html" class="card-link">
       <div class="card-preview">
           <div class="card-icon">🎯</div>
           <h2>My Card Title</h2>
       </div>
   </a>
   ```

## Adding Images

1. Place images in the `images/` directory
2. Reference them in card HTML: `<img src="../images/my-image.jpg" ...>`
3. The `onerror` handler shows emoji if image is missing

## Hosting Options

### GitHub Pages (Free, Easy)
1. Create a GitHub repository
2. Push your repository to GitHub
3. Go to Settings → Pages
4. Select branch and root folder
5. Your site will be live at `https://username.github.io/repo-name/`

### Netlify (Free, Easy)
1. Create account at netlify.com
2. Drag and drop the entire project folder (or connect your GitHub repo)
3. Site goes live immediately
4. Custom domain supported

### Vercel (Free, Easy)
1. Create account at vercel.com
2. Import from GitHub or upload folder
3. Automatic deployments

### Any Web Host
- Upload the project contents via FTP (index.html, cards/, css/, images/)
- Works with any web server (Apache, nginx, etc.)
- No special server configuration needed

## Testing Locally

Open `index.html` directly in your browser. That's it! No server needed for local testing.

## Browser Support

Works in all modern browsers:
- Chrome/Edge (last 2 versions)
- Firefox (last 2 versions)
- Safari (last 2 versions)
- Mobile browsers

## Customization

### Colors
Edit `css/styles.css`:
- Background gradient: `body { background: ... }`
- Button colors: `.btn-primary { background: ... }`

### Card Size
Edit `css/styles.css`:
```css
.card-wrapper {
    width: 400px;    /* Change width */
    height: 600px;   /* Change height */
}
```

### Fonts
Add Google Fonts in HTML `<head>`:
```html
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
```

Then update CSS:
```css
body {
    font-family: 'Playfair Display', serif;
}
```

## License

Use freely for personal or commercial projects.
