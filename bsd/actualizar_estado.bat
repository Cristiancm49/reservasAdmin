@echo off
set PGPASSWORD=1518
psql -U postgres -d reservas -c "SELECT actualizarEstadoReservas();"