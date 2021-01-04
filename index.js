import 'react-native-gesture-handler';
import React from 'react';

/**
 * @format
 */
import "./shims"

import {AppRegistry} from 'react-native';
import App from './App';
import {DefaultTheme, Provider as PaperProvider } from 'react-native-paper';

import {name as appName} from './app.json';

const theme = {
  ...DefaultTheme,
  roundness: 2,
  dark: true,
  mode: 'exact',
  colors: {
    ...DefaultTheme.colors,
    primary: 'tomato',
    accent: 'yellow',
    background: 'red'
  },
};

export default function Main() {
  return (
    <PaperProvider theme={theme}>
      <App />
    </PaperProvider>
  );
}

AppRegistry.registerComponent(appName, () => Main);