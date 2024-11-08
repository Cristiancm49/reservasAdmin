
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from '../login';
import Home from '../home';
import RegistroUsuario from '../registerUsuario';
import RegistroTurista from '../registerTurista';
import Reservas from '../reservas';
import ListReservas from '../reservasRegistradas';
import Auditoria from '../Auditoria'

import './App.css'

function App  ()  {
  

  return (
    <Router>
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route path="/home" element={<Home  />} />
      <Route path="/registroUsuario" element={<RegistroUsuario />} />
      <Route path="/registroTurista" element={<RegistroTurista />} />
      <Route path='/reservar' element={<Reservas />} />
      <Route path='/reseervasRegistradas' element={<ListReservas />} />
      <Route path='/auditoria' element={<Auditoria />} />

    </Routes>
  </Router>
  )
}

export default App
