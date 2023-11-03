// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-nocheck

module.exports = {
  ignorePatterns: ["node_modules/", "build/"],
  env: {
    browser: true,
    es2021: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended",
  ],
  overrides: [
    {
      env: {
        node: true,
      },
      files: [".eslintrc.{js,cjs}"],
      parserOptions: {
        sourceType: "script",
      },
    },
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },
  plugins: ["@typescript-eslint", "prettier"],
  rules: {
    "prettier/prettier": "off",
    "no-unused-vars": "off",
    quotes: ["error", "double"],
    semi: ["error", "always"],
  },
};
