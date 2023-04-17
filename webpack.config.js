const path = require('path');



module.exports = {
  mode: 'production',
  entry: ['./assets/build/app.js','./assets/build/style.css'],
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
          },
        },
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
      },
    ],
  },
  resolve: {
    alias: {
      jquery: path.resolve(__dirname, 'node_modules/jquery/dist/jquery.min.js'),
      'jquery-ui': path.resolve(__dirname, 'node_modules/jquery-ui-dist/jquery-ui.min.js'),
      'intl-tel-input': path.resolve(__dirname, 'node_modules/intl-tel-input/build/js/intlTelInput.min.js'),
      'intl-tel-input-jquery': path.resolve(__dirname, 'node_modules/intl-tel-input/build/js/intlTelInput-jquery.min.js'),
      'select2': path.resolve(__dirname, 'node_modules/select2/dist/js/select2.min.js'),
      'cart': path.resolve(__dirname, 'src/js/cart.js'),
    },
  },
  
};
