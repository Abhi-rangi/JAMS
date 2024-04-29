module.exports = {
  presets: [
    "next/babel",
    '@babel/preset-env',
    '@babel/preset-react',
    '@babel/preset-flow',
    'babel-preset-jest'
  ],
  plugins :[
    '@babel/plugin-transform-runtime',
  ],
};
