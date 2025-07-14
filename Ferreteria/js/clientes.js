let currentClienteId = null;

document.addEventListener("DOMContentLoaded", function () {
  loadClientes();
  initializeClientesPage();
});

function initializeClientesPage() {
  searchTable("searchClientes", "#clientesTable tbody");

  const form = document.getElementById("clienteForm");
  form.addEventListener("submit", handleFormSubmit);

  const logoutBtn = document.querySelector(".btn-logout");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {
      if (confirm("¿Estás seguro de que deseas cerrar sesión?")) {
        alert("Sesión cerrada correctamente");
      }
    });
  }
}

function loadClientes() {
  const clientes = loadData("clientes");
  renderClientesTable(clientes);
}

function renderClientesTable(clientes) {
  const columns = [
    { key: "nombreCliente", label: "Nombre" },
    { key: "apellidos", label: "Apellidos" },
    { key: "telefono", label: "Teléfono" },
    { key: "email", label: "Email" },
  ];

  const actions = [
    {
      label: '<i class="fas fa-eye"></i>',
      class: "btn-primary",
      onclick: "viewCliente",
    },
    