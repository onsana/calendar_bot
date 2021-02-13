module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './src/**/*.html',
    './src/**/*.js',
    './src/**/*.jsx',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      body: ['inter']
    },
    extend: {
      colors: {
        'deep-purple': {
          50: '#ede7f6',
          100: '#d1c4e9',
          200: '#b39ddb',
          300: '#9575cd',
          400: '#7e57c2',
          500: '#673ab7',
          600: '#5e35b1',
          700: '#512da8',
          800: '#4527a0',
          900: '#311b92',
          'accent-100': '#b388ff',
          'accent-200': '#7c4dff',
          'accent-400': '#651fff',
          'accent-700': '#6200ea',
        },
      },
      width: {
        '1/7': '14.2857143%',
        '2/7': '28.5714286%',
        '3/7': '42.8571429%',
        '4/7': '57.1428571%',
        '5/7': '71.4285714%',
        '6/7': '85.7142857%',
      }
    },
  },
  variants: {
    extend: {
      backgroundColor: ['responsive', 'hover', 'focus', 'active']
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/custom-forms'),
  ],
}