final defaultUnits = {
  'Peso': ['g', 'kg'],
  'Volume': ['ml', 'L'],
  'Unidade': ['un', 'par', 'cx', 'pct', 'band'],
};

final defaultQuantities = {
  'g': [100, 200, 250, 300, 400, 500, 750, 1000],
  'kg': [0.5, 1, 2, 3, 5, 10],
  'ml': [200, 300, 350, 500, 750, 1000],
  'L': [1, 1.5, 2, 3, 5, 6],
  'un': [1, 2, 3, 4, 6, 8, 10, 12, 15, 20, 24, 30],
  'par': [1, 2, 3],
  'cx': [1, 6, 12, 24],
  'pct': [1, 2, 3, 4],
  'band': [1],
};

final defaultItems = [
  {
    'name': 'Leite Integral',
    'category': 'Laticínios',
    'subcategory': 'Leites',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Leite Desnatado',
    'category': 'Laticínios',
    'subcategory': 'Leites',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Leite Semidesnatado',
    'category': 'Laticínios',
    'subcategory': 'Leites',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Leite Condensado',
    'category': 'Laticínios',
    'subcategory': 'Leites',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Creme de Leite',
    'category': 'Laticínios',
    'subcategory': 'Cremes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Iogurte Natural',
    'category': 'Laticínios',
    'subcategory': 'Iogurtes',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Iogurte com Frutas',
    'category': 'Laticínios',
    'subcategory': 'Iogurtes',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Manteiga com Sal',
    'category': 'Laticínios',
    'subcategory': 'Manteigas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Manteiga Sem Sal',
    'category': 'Laticínios',
    'subcategory': 'Manteigas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Requeijão Cremoso',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Queijo Prato',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Minas Frescal',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Parmesão',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Coalho',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Gouda',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Provolone',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Cottage',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ricota',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Doce de Leite',
    'category': 'Laticínios',
    'subcategory': 'Doces',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bebida Láctea',
    'category': 'Laticínios',
    'subcategory': 'Bebidas',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Mussarela',
    'category': 'Laticínios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg', 'un'],
    'defaultUnit': 'g'
  },
  {
    'name': 'Água Sanitária',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Desinfetantes',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Desinfetante',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Desinfetantes',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Limpador Multiuso',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Detergente Neutro',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Louças',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Detergente Concentrado',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Louças',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Esponja de Aço',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Louças',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Esponja Multiuso',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Louças',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Pano de Chão',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pano Multiuso',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saco de Lixo',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Álcool Líquido',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Desinfetantes',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Álcool Gel',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Desinfetantes',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Vassoura',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rodo',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pá de Lixo',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Geral',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Limpador de Vidros',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Específica',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Limpa Carpetes e Estofados',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Específica',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Cera para Piso',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Específica',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Removedor',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Específica',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Sabão em Pó',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Lavanderia',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Sabão Líquido',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Lavanderia',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Amaciante de Roupa',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Lavanderia',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Alvejante',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Lavanderia',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Tira Manchas',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Lavanderia',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Palha de Aço',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Louças',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Desengordurante',
    'category': 'Materiais de Limpeza',
    'subcategory': 'Limpeza Específica',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Sabonete em Barra',
    'category': 'Higiene Pessoal',
    'subcategory': 'Banho',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sabonete Líquido',
    'category': 'Higiene Pessoal',
    'subcategory': 'Banho',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Shampoo',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cabelo',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Condicionador',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cabelo',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Creme Dental',
    'category': 'Higiene Pessoal',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Escova de Dentes',
    'category': 'Higiene Pessoal',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fio Dental',
    'category': 'Higiene Pessoal',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enxaguante Bucal',
    'category': 'Higiene Pessoal',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Desodorante Roll-on',
    'category': 'Higiene Pessoal',
    'subcategory': 'Desodorantes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Desodorante Spray',
    'category': 'Higiene Pessoal',
    'subcategory': 'Desodorantes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Desodorante Creme',
    'category': 'Higiene Pessoal',
    'subcategory': 'Desodorantes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Aparelho de Barbear',
    'category': 'Higiene Pessoal',
    'subcategory': 'Barbear',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmina de Barbear',
    'category': 'Higiene Pessoal',
    'subcategory': 'Barbear',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Espuma de Barbear',
    'category': 'Higiene Pessoal',
    'subcategory': 'Barbear',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Gel de Barbear',
    'category': 'Higiene Pessoal',
    'subcategory': 'Barbear',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Pós Barba',
    'category': 'Higiene Pessoal',
    'subcategory': 'Barbear',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Hidratante Facial',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Faciais',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Protetor Solar Facial',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Faciais',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Protetor Solar Corporal',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados com o Corpo',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Algodão',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Pessoais',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cotonetes',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Pessoais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Absorvente',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Femininos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Protetor Diário',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Femininos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Lenço Umedecido',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Pessoais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Papel Higiênico',
    'category': 'Higiene Pessoal',
    'subcategory': 'Cuidados Pessoais',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Presunto',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Mussarela',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Prato',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Minas',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Salame',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Mortadela',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Peito de Peru',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Coalho',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Provolone',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Azeitona',
    'category': 'Frios',
    'subcategory': 'Conservas',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ovos de Codorna',
    'category': 'Frios',
    'subcategory': 'Conservas',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Salsicha',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Blanquet de Peru',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Lombo Canadense',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Rosbife',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pastrami',
    'category': 'Frios',
    'subcategory': 'Embutidos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Gouda',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Estepe',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Parmesão',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Queijo Gruyère',
    'category': 'Frios',
    'subcategory': 'Queijos',
    'availableUnits': ['g', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Patê',
    'category': 'Frios',
    'subcategory': 'Patês',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão Francês',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão de Forma',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão Integral',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão Doce',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão de Queijo',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Baguete',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Croissant',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sonho',
    'category': 'Padaria',
    'subcategory': 'Doces',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bolo',
    'category': 'Padaria',
    'subcategory': 'Doces',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Torta',
    'category': 'Padaria',
    'subcategory': 'Doces',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Rosca',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Broa de Milho',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão Italiano',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ciabatta',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Focaccia',
    'category': 'Padaria',
    'subcategory': 'Pães',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mini Pizza',
    'category': 'Padaria',
    'subcategory': 'Salgados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Esfiha',
    'category': 'Padaria',
    'subcategory': 'Salgados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coxinha',
    'category': 'Padaria',
    'subcategory': 'Salgados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pastel',
    'category': 'Padaria',
    'subcategory': 'Salgados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enroladinho de Salsicha',
    'category': 'Padaria',
    'subcategory': 'Salgados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Biscoitos',
    'category': 'Padaria',
    'subcategory': 'Outros',
    'availableUnits': ['g', 'kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sequilhos',
    'category': 'Padaria',
    'subcategory': 'Outros',
    'availableUnits': ['g', 'kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Arroz Branco',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Arroz Integral',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Feijão Carioca',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Feijão Preto',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Lentilha',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Grão de Bico',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ervilha Seca',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Milho de Pipoca',
    'category': 'Mercearia',
    'subcategory': 'Grãos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Farinha de Trigo',
    'category': 'Mercearia',
    'subcategory': 'Farinhas e Amidos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Farinha de Mandioca',
    'category': 'Mercearia',
    'subcategory': 'Farinhas e Amidos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Farinha de Milho',
    'category': 'Mercearia',
    'subcategory': 'Farinhas e Amidos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Amido de Milho',
    'category': 'Mercearia',
    'subcategory': 'Farinhas e Amidos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Açúcar Refinado',
    'category': 'Mercearia',
    'subcategory': 'Açúcares e Adoçantes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Açúcar Cristal',
    'category': 'Mercearia',
    'subcategory': 'Açúcares e Adoçantes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Açúcar Mascavo',
    'category': 'Mercearia',
    'subcategory': 'Açúcares e Adoçantes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Adoçante',
    'category': 'Mercearia',
    'subcategory': 'Açúcares e Adoçantes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sal Refinado',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Sal Grosso',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pimenta do Reino',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Orégano',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Louro',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caldo de Galinha',
    'category': 'Mercearia',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Macarrão Espaguete',
    'category': 'Mercearia',
    'subcategory': 'Massas',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Macarrão Parafuso',
    'category': 'Mercearia',
    'subcategory': 'Massas',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Macarrão Penne',
    'category': 'Mercearia',
    'subcategory': 'Massas',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lasanha',
    'category': 'Mercearia',
    'subcategory': 'Massas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Molho de Tomate',
    'category': 'Mercearia',
    'subcategory': 'Molhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Maionese',
    'category': 'Mercearia',
    'subcategory': 'Molhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ketchup',
    'category': 'Mercearia',
    'subcategory': 'Molhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mostarda',
    'category': 'Mercearia',
    'subcategory': 'Molhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Óleo de Soja',
    'category': 'Mercearia',
    'subcategory': 'Óleos',
    'availableUnits': ['un', 'L'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Azeite de Oliva',
    'category': 'Mercearia',
    'subcategory': 'Óleos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vinagre',
    'category': 'Mercearia',
    'subcategory': 'Condimentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Leite em Pó Integral',
    'category': 'Mercearia',
    'subcategory': 'Leites e Achocolatados',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Achocolatado em Pó',
    'category': 'Mercearia',
    'subcategory': 'Leites e Achocolatados',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Café Torrado e Moído',
    'category': 'Mercearia',
    'subcategory': 'Cafés e Chás',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Chá',
    'category': 'Mercearia',
    'subcategory': 'Cafés e Chás',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Biscoito Água e Sal',
    'category': 'Mercearia',
    'subcategory': 'Biscoitos e Bolachas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Biscoito Maisena',
    'category': 'Mercearia',
    'subcategory': 'Biscoitos e Bolachas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bolacha Recheada',
    'category': 'Mercearia',
    'subcategory': 'Biscoitos e Bolachas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Goiabada',
    'category': 'Mercearia',
    'subcategory': 'Doces e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Doce de Leite',
    'category': 'Mercearia',
    'subcategory': 'Doces e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Leite Condensado',
    'category': 'Mercearia',
    'subcategory': 'Doces e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Creme de Leite',
    'category': 'Mercearia',
    'subcategory': 'Doces e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ervilha em Conserva',
    'category': 'Mercearia',
    'subcategory': 'Enlatados e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Milho em Conserva',
    'category': 'Mercearia',
    'subcategory': 'Enlatados e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Atum em Conserva',
    'category': 'Mercearia',
    'subcategory': 'Enlatados e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sardinha em Conserva',
    'category': 'Mercearia',
    'subcategory': 'Enlatados e Conservas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Azeitona em Conserva',
    'category': 'Mercearia',
    'subcategory': 'Enlatados e Conservas',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sopa Desidratada',
    'category': 'Mercearia',
    'subcategory': 'Instantâneos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Macarrão Instantâneo',
    'category': 'Mercearia',
    'subcategory': 'Instantâneos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Gelatina em Pó',
    'category': 'Mercearia',
    'subcategory': 'Sobremesas em Pó',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pudim em Pó',
    'category': 'Mercearia',
    'subcategory': 'Sobremesas em Pó',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fermento em Pó',
    'category': 'Mercearia',
    'subcategory': 'Ingredientes para Bolo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coco Ralado',
    'category': 'Mercearia',
    'subcategory': 'Ingredientes para Bolo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Granulado',
    'category': 'Mercearia',
    'subcategory': 'Ingredientes para Bolo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Barra de Cereal',
    'category': 'Mercearia',
    'subcategory': 'Snacks',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Torradas',
    'category': 'Mercearia',
    'subcategory': 'Snacks',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pipoca de Microondas',
    'category': 'Mercearia',
    'subcategory': 'Snacks',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Semente de Chia',
    'category': 'Mercearia',
    'subcategory': 'Produtos Naturais',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Semente de Linhaça',
    'category': 'Mercearia',
    'subcategory': 'Produtos Naturais',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Uva Passa',
    'category': 'Mercearia',
    'subcategory': 'Frutas Secas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Damasco Seco',
    'category': 'Mercearia',
    'subcategory': 'Frutas Secas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ameixa Seca',
    'category': 'Mercearia',
    'subcategory': 'Frutas Secas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Acém',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Alcatra',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Contrafilé',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Filé Mignon',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Patinho',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Coxão Mole',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Coxão Duro',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Maminha',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Picanha',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Fraldinha',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Cupim',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Músculo',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ponta de Agulha',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Costela Bovina',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Linguiça Toscana',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Linguiça Calabresa',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Miúdos de Boi',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Bisteca Bovina',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Carne Moída',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pé de Boi',
    'category': 'Carnes',
    'subcategory': 'Bovina',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Carré de Cordeiro',
    'category': 'Carnes',
    'subcategory': 'Cordeiro',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Paleta de Cordeiro',
    'category': 'Carnes',
    'subcategory': 'Cordeiro',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pernil de Cordeiro',
    'category': 'Carnes',
    'subcategory': 'Cordeiro',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Costela de Cordeiro',
    'category': 'Carnes',
    'subcategory': 'Cordeiro',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Linguiça de Cordeiro',
    'category': 'Carnes',
    'subcategory': 'Cordeiro',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Lombo de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pernil de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Costela de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Bisteca de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Barriga de Porco (Pancetta)',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Linguiça de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Bacon',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Joelho de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pé de Porco',
    'category': 'Carnes',
    'subcategory': 'Suína',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Frango Inteiro',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Peito de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Coxa de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Sobrecoxa de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Asa de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Coração de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Linguiça de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Filé de Frango',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Frango à Passarinho',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pato',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Peru',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Marreco',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Galinha Caipira',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Codornas',
    'category': 'Carnes',
    'subcategory': 'Aves',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Salmão',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Atum',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Bacalhau',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Tilápia',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pescada',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Sardinha',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Merluza',
    'category': 'Carnes',
    'subcategory': 'Peixes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Camarão',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Lula',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Polvo',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Mexilhão',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ostra',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caranguejo',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Lagosta',
    'category': 'Carnes',
    'subcategory': 'Frutos do Mar',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Rã',
    'category': 'Carnes',
    'subcategory': 'Exóticas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Javali',
    'category': 'Carnes',
    'subcategory': 'Exóticas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Coelho',
    'category': 'Carnes',
    'subcategory': 'Exóticas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Fogão',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Forno',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Geladeira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Freezer',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Microondas',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Batedeira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Liquidificador',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Panela de Pressão',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Panelas',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Panela Avulsa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Frigideira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Talheres',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Faca Avulsa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tábua de Corte',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Pratos',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Prato Avulso',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Copos',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Copo Avulso',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Xícaras',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Xícara Avulsa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Potes',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Assadeira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Refratário',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jarra',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Garrafa Térmica',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Escorredor de Louça',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lixeira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ralador',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Abridor de Latas',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saca-rolhas',
    'category': 'Utensílios de Casa',
    'subcategory': 'Cozinha',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bacia',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Balde',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vassoura',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rodo',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pá de Lixo',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Esponja',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pano de Chão',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Varal',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pregador de Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tábua de Passar Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ferro de Passar Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cesto de Roupa Suja',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Máquina de Lavar Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Secadora de Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Lavanderia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Aspirador de Pó',
    'category': 'Utensílios de Casa',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mesa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cadeira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sofá',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guarda-Roupa',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Estante',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Escrivaninha',
    'category': 'Utensílios de Casa',
    'subcategory': 'Móveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tapete',
    'category': 'Utensílios de Casa',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cortina',
    'category': 'Utensílios de Casa',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Almofada',
    'category': 'Utensílios de Casa',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmpada',
    'category': 'Utensílios de Casa',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Abajur',
    'category': 'Utensílios de Casa',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Luminária',
    'category': 'Utensílios de Casa',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Extintor de Incêndio',
    'category': 'Utensílios de Casa',
    'subcategory': 'Segurança',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Detector de Fumaça',
    'category': 'Utensílios de Casa',
    'subcategory': 'Segurança',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ferramentas',
    'category': 'Utensílios de Casa',
    'subcategory': 'Diversos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Escada',
    'category': 'Utensílios de Casa',
    'subcategory': 'Diversos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mangueira',
    'category': 'Utensílios de Casa',
    'subcategory': 'Jardinagem',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vaso de Planta',
    'category': 'Utensílios de Casa',
    'subcategory': 'Jardinagem',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enxada',
    'category': 'Utensílios de Casa',
    'subcategory': 'Jardinagem',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pá',
    'category': 'Utensílios de Casa',
    'subcategory': 'Jardinagem',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rastelo',
    'category': 'Utensílios de Casa',
    'subcategory': 'Jardinagem',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Água Mineral Sem Gás',
    'category': 'Bebidas',
    'subcategory': 'Águas',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Água Mineral Com Gás',
    'category': 'Bebidas',
    'subcategory': 'Águas',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Refrigerante Cola',
    'category': 'Bebidas',
    'subcategory': 'Refrigerantes',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Refrigerante Guaraná',
    'category': 'Bebidas',
    'subcategory': 'Refrigerantes',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Refrigerante Limão',
    'category': 'Bebidas',
    'subcategory': 'Refrigerantes',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Suco de Laranja',
    'category': 'Bebidas',
    'subcategory': 'Sucos',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Suco de Uva',
    'category': 'Bebidas',
    'subcategory': 'Sucos',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Suco de Maracujá',
    'category': 'Bebidas',
    'subcategory': 'Sucos',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Cerveja Pilsen',
    'category': 'Bebidas',
    'subcategory': 'Cervejas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cerveja IPA',
    'category': 'Bebidas',
    'subcategory': 'Cervejas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cerveja Lager',
    'category': 'Bebidas',
    'subcategory': 'Cervejas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vinho Tinto Seco',
    'category': 'Bebidas',
    'subcategory': 'Vinhos',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vinho Branco Seco',
    'category': 'Bebidas',
    'subcategory': 'Vinhos',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vinho Rosé',
    'category': 'Bebidas',
    'subcategory': 'Vinhos',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Espumante',
    'category': 'Bebidas',
    'subcategory': 'Vinhos',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vodka',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Whisky',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Gin',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rum',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cachaça',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Licor',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Conhaque',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tequila',
    'category': 'Bebidas',
    'subcategory': 'Destilados',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Energético',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Isotônico',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Chá Gelado',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Água Tônica',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Bitter',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sidra',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saquê',
    'category': 'Bebidas',
    'subcategory': 'Outras Bebidas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Hambúrguer',
    'category': 'Congelados',
    'subcategory': 'Carnes',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Nuggets',
    'category': 'Congelados',
    'subcategory': 'Aves',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Frango Empanado',
    'category': 'Congelados',
    'subcategory': 'Aves',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Peixe Empanado',
    'category': 'Congelados',
    'subcategory': 'Peixes',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Batata Frita Congelada',
    'category': 'Congelados',
    'subcategory': 'Legumes e Vegetais',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Ervilha Congelada',
    'category': 'Congelados',
    'subcategory': 'Legumes e Vegetais',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Milho Congelado',
    'category': 'Congelados',
    'subcategory': 'Legumes e Vegetais',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Legumes Congelados (Mix)',
    'category': 'Congelados',
    'subcategory': 'Legumes e Vegetais',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Pizza Congelada',
    'category': 'Congelados',
    'subcategory': 'Massas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lasanha Congelada',
    'category': 'Congelados',
    'subcategory': 'Massas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pão de Queijo Congelado',
    'category': 'Congelados',
    'subcategory': 'Massas',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Massa Folhada Congelada',
    'category': 'Congelados',
    'subcategory': 'Massas',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sorvete',
    'category': 'Congelados',
    'subcategory': 'Sobremesas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Açaí Congelado',
    'category': 'Congelados',
    'subcategory': 'Sobremesas',
    'availableUnits': ['ml', 'L', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Polpa de Fruta Congelada',
    'category': 'Congelados',
    'subcategory': 'Frutas',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Morango Congelado',
    'category': 'Congelados',
    'subcategory': 'Frutas',
    'availableUnits': ['kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Polenta Congelada',
    'category': 'Congelados',
    'subcategory': 'Pratos Prontos',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Escondidinho Congelado',
    'category': 'Congelados',
    'subcategory': 'Pratos Prontos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Salgados Congelados (Coxinha, Risole, etc)',
    'category': 'Congelados',
    'subcategory': 'Salgados',
    'availableUnits': ['un', 'kg', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Analgésico (Paracetamol)',
    'category': 'Farmácia',
    'subcategory': 'Analgésicos e Antitérmicos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Analgésico (Dipirona)',
    'category': 'Farmácia',
    'subcategory': 'Analgésicos e Antitérmicos',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Anti-inflamatório (Ibuprofeno)',
    'category': 'Farmácia',
    'subcategory': 'Analgésicos e Antitérmicos',
    'availableUnits': ['un'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Antigripal',
    'category': 'Farmácia',
    'subcategory': 'Gripe e Resfriado',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vitamina C',
    'category': 'Farmácia',
    'subcategory': 'Vitaminas e Suplementos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Multivitamínico',
    'category': 'Farmácia',
    'subcategory': 'Vitaminas e Suplementos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Antialérgico (Loratadina)',
    'category': 'Farmácia',
    'subcategory': 'Alergia',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Antialérgico (Cetirizina)',
    'category': 'Farmácia',
    'subcategory': 'Alergia',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pomada para Assadura',
    'category': 'Farmácia',
    'subcategory': 'Infantil',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Termômetro',
    'category': 'Farmácia',
    'subcategory': 'Infantil',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Teste de Gravidez',
    'category': 'Farmácia',
    'subcategory': 'Testes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Curativo',
    'category': 'Farmácia',
    'subcategory': 'Primeiros Socorros',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Algodão',
    'category': 'Farmácia',
    'subcategory': 'Primeiros Socorros',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Álcool 70%',
    'category': 'Farmácia',
    'subcategory': 'Primeiros Socorros',
    'availableUnits': ['ml', 'L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Gaze',
    'category': 'Farmácia',
    'subcategory': 'Primeiros Socorros',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Antisséptico (Povidine)',
    'category': 'Farmácia',
    'subcategory': 'Primeiros Socorros',
    'availableUnits': ['ml'],
    'defaultUnit': 'ml'
  },
  {
    'name': 'Repelente',
    'category': 'Farmácia',
    'subcategory': 'Higiene e Proteção',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Protetor Solar',
    'category': 'Farmácia',
    'subcategory': 'Higiene e Proteção',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sabonete Íntimo',
    'category': 'Farmácia',
    'subcategory': 'Higiene e Proteção',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Absorvente',
    'category': 'Farmácia',
    'subcategory': 'Higiene e Proteção',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Fralda Geriátrica',
    'category': 'Farmácia',
    'subcategory': 'Higiene e Proteção',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Escova de Dentes',
    'category': 'Farmácia',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pasta de Dente',
    'category': 'Farmácia',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fio Dental',
    'category': 'Farmácia',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enxaguante Bucal',
    'category': 'Farmácia',
    'subcategory': 'Higiene Bucal',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Medicamento Controlado (Genérico)',
    'category': 'Farmácia',
    'subcategory': 'Medicamentos Controlados',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Anticoncepcional',
    'category': 'Farmácia',
    'subcategory': 'Medicamentos Controlados',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Xarope para Tosse',
    'category': 'Farmácia',
    'subcategory': 'Tosse e Garganta',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pastilha para Garganta',
    'category': 'Farmácia',
    'subcategory': 'Tosse e Garganta',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Colírio',
    'category': 'Farmácia',
    'subcategory': 'Olhos',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Descongestionante Nasal',
    'category': 'Farmácia',
    'subcategory': 'Nariz',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Medicamento Genérico (Diversos)',
    'category': 'Farmácia',
    'subcategory': 'Genéricos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Homeopatia (Diversos)',
    'category': 'Farmácia',
    'subcategory': 'Homeopatia',
    'availableUnits': ['un', 'pct', 'ml'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Leite Infantil',
    'category': 'Farmácia',
    'subcategory': 'Infantil',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cimento',
    'category': 'Materiais de Construção',
    'subcategory': 'Básicos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Areia',
    'category': 'Materiais de Construção',
    'subcategory': 'Básicos',
    'availableUnits': ['m³'],
    'defaultUnit': 'm³'
  },
  {
    'name': 'Brita',
    'category': 'Materiais de Construção',
    'subcategory': 'Básicos',
    'availableUnits': ['m³'],
    'defaultUnit': 'm³'
  },
  {
    'name': 'Cal',
    'category': 'Materiais de Construção',
    'subcategory': 'Básicos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Bloco Cerâmico',
    'category': 'Materiais de Construção',
    'subcategory': 'Alvenaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bloco de Concreto',
    'category': 'Materiais de Construção',
    'subcategory': 'Alvenaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tijolo',
    'category': 'Materiais de Construção',
    'subcategory': 'Alvenaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vergalhão',
    'category': 'Materiais de Construção',
    'subcategory': 'Estrutura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Arame Recozido',
    'category': 'Materiais de Construção',
    'subcategory': 'Estrutura',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Madeira para Construção (Pinus)',
    'category': 'Materiais de Construção',
    'subcategory': 'Madeira',
    'availableUnits': ['m³'],
    'defaultUnit': 'm³'
  },
  {
    'name': 'Madeira para Construção (Eucalipto)',
    'category': 'Materiais de Construção',
    'subcategory': 'Madeira',
    'availableUnits': ['m³'],
    'defaultUnit': 'm³'
  },
  {
    'name': 'Telha Cerâmica',
    'category': 'Materiais de Construção',
    'subcategory': 'Cobertura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Telha de Concreto',
    'category': 'Materiais de Construção',
    'subcategory': 'Cobertura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Telha de Fibrocimento',
    'category': 'Materiais de Construção',
    'subcategory': 'Cobertura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tinta Acrílica',
    'category': 'Materiais de Construção',
    'subcategory': 'Acabamento',
    'availableUnits': ['L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Massa Corrida',
    'category': 'Materiais de Construção',
    'subcategory': 'Acabamento',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Gesso',
    'category': 'Materiais de Construção',
    'subcategory': 'Acabamento',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Argamassa',
    'category': 'Materiais de Construção',
    'subcategory': 'Assentamento',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Piso Cerâmico',
    'category': 'Materiais de Construção',
    'subcategory': 'Revestimentos',
    'availableUnits': ['m²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Piso Porcelanato',
    'category': 'Materiais de Construção',
    'subcategory': 'Revestimentos',
    'availableUnits': ['m²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Rejunte',
    'category': 'Materiais de Construção',
    'subcategory': 'Revestimentos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Azulejo',
    'category': 'Materiais de Construção',
    'subcategory': 'Revestimentos',
    'availableUnits': ['m²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Cano de PVC',
    'category': 'Materiais de Construção',
    'subcategory': 'Hidráulica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Conexões de PVC',
    'category': 'Materiais de Construção',
    'subcategory': 'Hidráulica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa d\'Água',
    'category': 'Materiais de Construção',
    'subcategory': 'Hidráulica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Torneira',
    'category': 'Materiais de Construção',
    'subcategory': 'Hidráulica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vaso Sanitário',
    'category': 'Materiais de Construção',
    'subcategory': 'Louças Sanitárias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pia',
    'category': 'Materiais de Construção',
    'subcategory': 'Louças Sanitárias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Chuveiro',
    'category': 'Materiais de Construção',
    'subcategory': 'Louças Sanitárias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fio Elétrico',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Cabo Elétrico',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Eletroduto',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa de Luz',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Interruptor',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tomada',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Disjuntor',
    'category': 'Materiais de Construção',
    'subcategory': 'Elétrica',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmpada',
    'category': 'Materiais de Construção',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Abraçadeira',
    'category': 'Materiais de Construção',
    'subcategory': 'Fixação',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Parafuso',
    'category': 'Materiais de Construção',
    'subcategory': 'Fixação',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Prego',
    'category': 'Materiais de Construção',
    'subcategory': 'Fixação',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Tinta Impermeabilizante',
    'category': 'Materiais de Construção',
    'subcategory': 'Impermeabilização',
    'availableUnits': ['L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Manta Asfáltica',
    'category': 'Materiais de Construção',
    'subcategory': 'Impermeabilização',
    'availableUnits': ['m²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Selante',
    'category': 'Materiais de Construção',
    'subcategory': 'Vedação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Silicone',
    'category': 'Materiais de Construção',
    'subcategory': 'Vedação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Porta',
    'category': 'Materiais de Construção',
    'subcategory': 'Esquadrias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Janela',
    'category': 'Materiais de Construção',
    'subcategory': 'Esquadrias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Serviço de Pedreiro',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'dia', 'serviço'],
    'defaultUnit': 'dia'
  },
  {
    'name': 'Serviço de Eletricista',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Encanador',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Pintor',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'dia', 'm²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Serviço de Gesseiro',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'dia', 'm²'],
    'defaultUnit': 'm²'
  },
  {
    'name': 'Serviço de Carpinteiro',
    'category': 'Serviços',
    'subcategory': 'Construção e Reforma',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Jardineiro',
    'category': 'Serviços',
    'subcategory': 'Jardinagem',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Limpeza',
    'category': 'Serviços',
    'subcategory': 'Limpeza',
    'availableUnits': ['hora', 'dia', 'serviço'],
    'defaultUnit': 'hora'
  },
  {
    'name': 'Serviço de Babá',
    'category': 'Serviços',
    'subcategory': 'Cuidados Pessoais',
    'availableUnits': ['hora', 'dia'],
    'defaultUnit': 'hora'
  },
  {
    'name': 'Serviço de Professor Particular',
    'category': 'Serviços',
    'subcategory': 'Aulas e Cursos',
    'availableUnits': ['hora', 'aula'],
    'defaultUnit': 'hora'
  },
  {
    'name': 'Serviço de Manutenção de Computadores',
    'category': 'Serviços',
    'subcategory': 'Tecnologia',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Design Gráfico',
    'category': 'Serviços',
    'subcategory': 'Design',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Fotografia',
    'category': 'Serviços',
    'subcategory': 'Eventos',
    'availableUnits': ['hora', 'evento'],
    'defaultUnit': 'evento'
  },
  {
    'name': 'Serviço de Buffet',
    'category': 'Serviços',
    'subcategory': 'Eventos',
    'availableUnits': ['pessoa', 'evento'],
    'defaultUnit': 'pessoa'
  },
  {
    'name': 'Serviço de Transporte (Frete)',
    'category': 'Serviços',
    'subcategory': 'Transporte',
    'availableUnits': ['km', 'serviço'],
    'defaultUnit': 'km'
  },
  {
    'name': 'Serviço de Mudança',
    'category': 'Serviços',
    'subcategory': 'Transporte',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Mecânico',
    'category': 'Serviços',
    'subcategory': 'Automotivo',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Refrigeração',
    'category': 'Serviços',
    'subcategory': 'Manutenção',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Dedetização',
    'category': 'Serviços',
    'subcategory': 'Manutenção',
    'availableUnits': ['m²', 'serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Consultoria',
    'category': 'Serviços',
    'subcategory': 'Consultoria',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'hora'
  },
  {
    'name': 'Serviço de Massagem',
    'category': 'Serviços',
    'subcategory': 'Beleza e Bem-Estar',
    'availableUnits': ['hora', 'serviço'],
    'defaultUnit': 'hora'
  },
  {
    'name': 'Serviço de Estética',
    'category': 'Serviços',
    'subcategory': 'Beleza e Bem-Estar',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Camiseta Masculina',
    'category': 'Roupas',
    'subcategory': 'Masculino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Camisa Social Masculina',
    'category': 'Roupas',
    'subcategory': 'Masculino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Calça Jeans Masculina',
    'category': 'Roupas',
    'subcategory': 'Masculino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bermuda Masculina',
    'category': 'Roupas',
    'subcategory': 'Masculino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Terno Masculino',
    'category': 'Roupas',
    'subcategory': 'Masculino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Blusa Feminina',
    'category': 'Roupas',
    'subcategory': 'Feminino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vestido Feminino',
    'category': 'Roupas',
    'subcategory': 'Feminino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saia Feminina',
    'category': 'Roupas',
    'subcategory': 'Feminino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Calça Feminina',
    'category': 'Roupas',
    'subcategory': 'Feminino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Casaco Feminino',
    'category': 'Roupas',
    'subcategory': 'Feminino',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roupa Infantil (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Infantil',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Meia (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Íntima',
    'availableUnits': ['un', 'par'],
    'defaultUnit': 'par'
  },
  {
    'name': 'Cueca (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Íntima',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Calcinha (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Íntima',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pijama (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Íntima',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Traje de Banho (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Praia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roupa Esportiva (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Esportiva',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jaqueta (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Outros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Moletom (Diversos)',
    'category': 'Roupas',
    'subcategory': 'Outros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ração para Cães (Adulto)',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ração para Cães (Filhote)',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ração para Gatos (Adulto)',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ração para Gatos (Filhote)',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ração para Aves',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ração para Peixes',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['g', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Petiscos para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Petiscos para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Alimentação',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Antipulgas',
    'category': 'Pet Shop',
    'subcategory': 'Medicamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vermífugo',
    'category': 'Pet Shop',
    'subcategory': 'Medicamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Antibiótico Veterinário',
    'category': 'Pet Shop',
    'subcategory': 'Medicamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Shampoo para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Shampoo para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Condicionador para Pets',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['ml', 'un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sabonete para Pets',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tapete Higiênico para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Areia Sanitária para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['kg', 'un'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pente para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pente para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cortador de Unhas para Pets',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coleira para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coleira para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guia para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roupa para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Brinquedos para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Brinquedos para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Casa para Cães',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Arranhador para Gatos',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Aquário',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Gaiola para Aves',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Comedouro/Bebedouro',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa de Transporte',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coleira Anti-Latido',
    'category': 'Pet Shop',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Atrai ou Repelente',
    'category': 'Pet Shop',
    'subcategory': 'Higiene',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pneu',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bateria',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pastilha de Freio',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Filtro de Óleo',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Filtro de Ar',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Velas de Ignição',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Amortecedor',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmpada Automotiva',
    'category': 'Automotivo',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Limpador de Para-brisa',
    'category': 'Automotivo',
    'subcategory': 'Acessórios',
    'availableUnits': ['un', 'par'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Palheta do Limpador',
    'category': 'Automotivo',
    'subcategory': 'Acessórios',
    'availableUnits': ['un', 'par'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capa para Carro',
    'category': 'Automotivo',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tapete Automotivo',
    'category': 'Automotivo',
    'subcategory': 'Acessórios',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Óleo de Motor',
    'category': 'Automotivo',
    'subcategory': 'Fluidos',
    'availableUnits': ['L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Aditivo para Radiador',
    'category': 'Automotivo',
    'subcategory': 'Fluidos',
    'availableUnits': ['L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Fluido de Freio',
    'category': 'Automotivo',
    'subcategory': 'Fluidos',
    'availableUnits': ['L'],
    'defaultUnit': 'L'
  },
  {
    'name': 'Serviço de Alinhamento',
    'category': 'Automotivo',
    'subcategory': 'Serviços',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Balanceamento',
    'category': 'Automotivo',
    'subcategory': 'Serviços',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Troca de Óleo',
    'category': 'Automotivo',
    'subcategory': 'Serviços',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Serviço de Troca de Pneus',
    'category': 'Automotivo',
    'subcategory': 'Serviços',
    'availableUnits': ['serviço'],
    'defaultUnit': 'serviço'
  },
  {
    'name': 'Cera Automotiva',
    'category': 'Automotivo',
    'subcategory': 'Limpeza',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Shampoo Automotivo',
    'category': 'Automotivo',
    'subcategory': 'Limpeza',
    'availableUnits': ['un', 'ml'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Aspirador Automotivo',
    'category': 'Automotivo',
    'subcategory': 'Limpeza',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Notebook',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Computadores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Computador Desktop',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Computadores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Monitor',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Computadores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Teclado',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mouse',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Impressora Multifuncional',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Impressoras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cartucho de Tinta',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Impressoras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Celular Smartphone',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Celulares',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fone de Ouvido',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa de Som Bluetooth',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roteador Wi-Fi',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Rede',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cabo de Rede',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Rede',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'HD Externo',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Armazenamento',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pen Drive',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Armazenamento',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'SSD',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Armazenamento',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Placa de Vídeo',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Memória RAM',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Processador',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fonte de Alimentação',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Peças',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Webcam',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Monitor Gamer',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Computadores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Nobreak',
    'category': 'Informática/Eletrônicos',
    'subcategory': 'Energia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bola de Futebol',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Coletivos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bola de Vôlei',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Coletivos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bola de Basquete',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Coletivos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rede de Vôlei',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Coletivos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rede de Tênis',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Individuais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Raquete de Tênis',
    'category': 'Esporte e Lazer',
    'subcategory': 'Esportes Individuais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bicicleta',
    'category': 'Esporte e Lazer',
    'subcategory': 'Ciclismo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capacete de Ciclismo',
    'category': 'Esporte e Lazer',
    'subcategory': 'Ciclismo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roupa de Ciclismo',
    'category': 'Esporte e Lazer',
    'subcategory': 'Ciclismo',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Barraca de Camping',
    'category': 'Esporte e Lazer',
    'subcategory': 'Camping',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saco de Dormir',
    'category': 'Esporte e Lazer',
    'subcategory': 'Camping',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mochila de Camping',
    'category': 'Esporte e Lazer',
    'subcategory': 'Camping',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Churrasqueira',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Piscina Inflável',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cadeira de Praia',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guarda-Sol',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Dardos',
    'category': 'Esporte e Lazer',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Tabuleiro',
    'category': 'Esporte e Lazer',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Baralho',
    'category': 'Esporte e Lazer',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Patinete',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Skate',
    'category': 'Esporte e Lazer',
    'subcategory': 'Lazer',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Brinquedo Infantil',
    'category': 'Esporte e Lazer',
    'subcategory': 'Brinquedos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Boneca',
    'category': 'Esporte e Lazer',
    'subcategory': 'Brinquedos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Construção',
    'category': 'Esporte e Lazer',
    'subcategory': 'Brinquedos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sofá de 2 Lugares',
    'category': 'Móveis e Decoração',
    'subcategory': 'Sofás',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sofá de 3 Lugares',
    'category': 'Móveis e Decoração',
    'subcategory': 'Sofás',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sofá Retrátil',
    'category': 'Móveis e Decoração',
    'subcategory': 'Sofás',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sofá Cama',
    'category': 'Móveis e Decoração',
    'subcategory': 'Sofás',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama de Solteiro',
    'category': 'Móveis e Decoração',
    'subcategory': 'Camas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama de Casal',
    'category': 'Móveis e Decoração',
    'subcategory': 'Camas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cama Box',
    'category': 'Móveis e Decoração',
    'subcategory': 'Camas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mesa de Jantar',
    'category': 'Móveis e Decoração',
    'subcategory': 'Mesas e Cadeiras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cadeira de Jantar',
    'category': 'Móveis e Decoração',
    'subcategory': 'Mesas e Cadeiras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Armário de Cozinha',
    'category': 'Móveis e Decoração',
    'subcategory': 'Armários',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guarda-Roupa',
    'category': 'Móveis e Decoração',
    'subcategory': 'Armários',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Estante para Livros',
    'category': 'Móveis e Decoração',
    'subcategory': 'Armários',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Quadro Decorativo',
    'category': 'Móveis e Decoração',
    'subcategory': 'Objetos de Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vaso de Cerâmica',
    'category': 'Móveis e Decoração',
    'subcategory': 'Objetos de Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Espelho',
    'category': 'Móveis e Decoração',
    'subcategory': 'Objetos de Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cortina',
    'category': 'Móveis e Decoração',
    'subcategory': 'Objetos de Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tapete',
    'category': 'Móveis e Decoração',
    'subcategory': 'Objetos de Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Geladeira',
    'category': 'Móveis e Decoração',
    'subcategory': 'Eletrodomésticos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Máquina de Lavar Roupa',
    'category': 'Móveis e Decoração',
    'subcategory': 'Eletrodomésticos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fogão',
    'category': 'Móveis e Decoração',
    'subcategory': 'Eletrodomésticos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Microondas',
    'category': 'Móveis e Decoração',
    'subcategory': 'Eletrodomésticos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Luminária de Teto',
    'category': 'Móveis e Decoração',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Abajur',
    'category': 'Móveis e Decoração',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmpada',
    'category': 'Móveis e Decoração',
    'subcategory': 'Iluminação',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caderno Universitário',
    'category': 'Material Escolar',
    'subcategory': 'Papelaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caderno Brochurão',
    'category': 'Material Escolar',
    'subcategory': 'Papelaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caneta Esferográfica (Azul)',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caneta Esferográfica (Preta)',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caneta Esferográfica (Vermelha)',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lápis Preto',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Borracha',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Apontador',
    'category': 'Material Escolar',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Régua',
    'category': 'Material Escolar',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tesoura Escolar',
    'category': 'Material Escolar',
    'subcategory': 'Artes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cola Branca',
    'category': 'Material Escolar',
    'subcategory': 'Artes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lápis de Cor',
    'category': 'Material Escolar',
    'subcategory': 'Pintura',
    'availableUnits': ['un', 'cx'],
    'defaultUnit': 'cx'
  },
  {
    'name': 'Canetinha Hidrográfica',
    'category': 'Material Escolar',
    'subcategory': 'Pintura',
    'availableUnits': ['un', 'cx'],
    'defaultUnit': 'cx'
  },
  {
    'name': 'Tinta Guache',
    'category': 'Material Escolar',
    'subcategory': 'Pintura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pincel',
    'category': 'Material Escolar',
    'subcategory': 'Pintura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Massa de Modelar',
    'category': 'Material Escolar',
    'subcategory': 'Artes',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Giz de Cera',
    'category': 'Material Escolar',
    'subcategory': 'Pintura',
    'availableUnits': ['un', 'cx'],
    'defaultUnit': 'cx'
  },
  {
    'name': 'Bloco de Desenho',
    'category': 'Material Escolar',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Papel Sulfite',
    'category': 'Material Escolar',
    'subcategory': 'Papelaria',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Pasta',
    'category': 'Material Escolar',
    'subcategory': 'Organização',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mochila',
    'category': 'Material Escolar',
    'subcategory': 'Transporte',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Estojo',
    'category': 'Material Escolar',
    'subcategory': 'Organização',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Livro Didático',
    'category': 'Material Escolar',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Livro de Literatura',
    'category': 'Material Escolar',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Dicionário',
    'category': 'Material Escolar',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Calculadora',
    'category': 'Material Escolar',
    'subcategory': 'Matemática',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Transferidor',
    'category': 'Material Escolar',
    'subcategory': 'Desenho Técnico',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Compasso',
    'category': 'Material Escolar',
    'subcategory': 'Desenho Técnico',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fita Adesiva',
    'category': 'Material Escolar',
    'subcategory': 'Papelaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Etiquetas',
    'category': 'Material Escolar',
    'subcategory': 'Papelaria',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mapa Mundi',
    'category': 'Material Escolar',
    'subcategory': 'Geografia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Globo Terrestre',
    'category': 'Material Escolar',
    'subcategory': 'Geografia',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Maçã Fuji',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Maçã Gala',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Banana Nanica',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Banana Prata',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Laranja Lima',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Laranja Pera',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Uva Thompson',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Uva Crimson',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Melancia Baby',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Melão Amarelo',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Mamão Papaia',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Morango Orgânico',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Abacaxi Pérola',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Limão Tahiti',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Manga Palmer',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Maracujá Azedo',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pera Williams',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pêssego Nacional',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ameixa Roxa',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Kiwi Importado',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Figo Roxo',
    'category': 'Hortifruti',
    'subcategory': 'Frutas',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Alface Americana',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Alface Crespa',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rúcula Hidropônica',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Agrião Orgânico',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Espinafre Congelado',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Couve Manteiga',
    'category': 'Hortifruti',
    'subcategory': 'Verduras',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Salsinha Desidratada',
    'category': 'Hortifruti',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cebolinha Verde',
    'category': 'Hortifruti',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Coentro em Maço',
    'category': 'Hortifruti',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Hortelã Fresca',
    'category': 'Hortifruti',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Alho Nacional',
    'category': 'Hortifruti',
    'subcategory': 'Temperos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tomate Italiano',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Tomate Cereja',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Cebola Roxa',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Batata Inglesa',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Cenoura Baby',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Abobrinha Italiana',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Berinjela Japonesa',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pimentão Amarelo',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Chuchu Orgânico',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Abóbora Cabotiá',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pepino Japonês',
    'category': 'Hortifruti',
    'subcategory': 'Legumes',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Ovo Branco Grande',
    'category': 'Hortifruti',
    'subcategory': 'Ovos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Ovo Caipira',
    'category': 'Hortifruti',
    'subcategory': 'Ovos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Ovo de Codorna',
    'category': 'Hortifruti',
    'subcategory': 'Ovos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Envelope (Diversos Tamanhos)',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Etiqueta Adesiva',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Bloco de Anotações',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fita Adesiva (Durex)',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Clips',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un', 'cx'],
    'defaultUnit': 'cx'
  },
  {
    'name': 'Grampeador',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Grampos para Grampeador',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Perfurador de Papel',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caneta Marca Texto',
    'category': 'Papelaria',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lápis de Cor (Caixa)',
    'category': 'Papelaria',
    'subcategory': 'Escrita',
    'availableUnits': ['un', 'cx'],
    'defaultUnit': 'cx'
  },
  {
    'name': 'Cola em Bastão',
    'category': 'Papelaria',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pincel Atômico',
    'category': 'Papelaria',
    'subcategory': 'Escrita',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Régua',
    'category': 'Papelaria',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Esquadro',
    'category': 'Papelaria',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Transferidor',
    'category': 'Papelaria',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Compasso',
    'category': 'Papelaria',
    'subcategory': 'Desenho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Papel Sulfite A4',
    'category': 'Papelaria',
    'subcategory': 'Papéis',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Papel Cartão',
    'category': 'Papelaria',
    'subcategory': 'Papéis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Papel Crepom',
    'category': 'Papelaria',
    'subcategory': 'Papéis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caderno Inteligente',
    'category': 'Papelaria',
    'subcategory': 'Cadernos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fichário',
    'category': 'Papelaria',
    'subcategory': 'Cadernos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Divisórias para Fichário',
    'category': 'Papelaria',
    'subcategory': 'Cadernos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Scanner',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Plastificadora',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Calculadora Científica',
    'category': 'Papelaria',
    'subcategory': 'Escritório',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Embalagem de Presente',
    'category': 'Artigos para Presente',
    'subcategory': 'Embalagens',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Laço de Presente',
    'category': 'Artigos para Presente',
    'subcategory': 'Embalagens',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cartão de Mensagem',
    'category': 'Artigos para Presente',
    'subcategory': 'Cartões',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pelúcia',
    'category': 'Artigos para Presente',
    'subcategory': 'Brinquedos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cesta de Café da Manhã',
    'category': 'Artigos para Presente',
    'subcategory': 'Cestas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Kit de Produtos de Beleza',
    'category': 'Artigos para Presente',
    'subcategory': 'Kits',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vaso de Flores',
    'category': 'Artigos para Presente',
    'subcategory': 'Flores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Buquê de Flores',
    'category': 'Artigos para Presente',
    'subcategory': 'Flores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ursinho de Pelúcia',
    'category': 'Artigos para Presente',
    'subcategory': 'Brinquedos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Xadrez',
    'category': 'Artigos para Presente',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Cartas',
    'category': 'Artigos para Presente',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Livro',
    'category': 'Artigos para Presente',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Copo Personalizado',
    'category': 'Artigos para Presente',
    'subcategory': 'Personalizados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Almofada Personalizada',
    'category': 'Artigos para Presente',
    'subcategory': 'Personalizados',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saco de Papel',
    'category': 'Embalagens',
    'subcategory': 'Papel',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Caixa de Papelão',
    'category': 'Embalagens',
    'subcategory': 'Papelão',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Saco Plástico',
    'category': 'Embalagens',
    'subcategory': 'Plástico',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Potes Plásticos',
    'category': 'Embalagens',
    'subcategory': 'Plástico',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Embalagem Isopor',
    'category': 'Embalagens',
    'subcategory': 'Isopor',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Filme Stretch',
    'category': 'Embalagens',
    'subcategory': 'Filmes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fita Adesiva Larga',
    'category': 'Embalagens',
    'subcategory': 'Adesivos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Papel Bolha',
    'category': 'Embalagens',
    'subcategory': 'Proteção',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Papel de Seda',
    'category': 'Embalagens',
    'subcategory': 'Papel',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Saco Kraft',
    'category': 'Embalagens',
    'subcategory': 'Papel',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Embalagem Térmica',
    'category': 'Embalagens',
    'subcategory': 'Térmicas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Forma de Bolo',
    'category': 'Embalagens',
    'subcategory': 'Alimentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Porta Docinhos',
    'category': 'Embalagens',
    'subcategory': 'Alimentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa para Pizza',
    'category': 'Embalagens',
    'subcategory': 'Alimentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sacola Plástica Personalizada',
    'category': 'Embalagens',
    'subcategory': 'Plástico',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Rótulos Adesivos',
    'category': 'Embalagens',
    'subcategory': 'Adesivos',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Quebra-Cabeça',
    'category': 'Brinquedos',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Tabuleiro (War)',
    'category': 'Brinquedos',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Cartas (Uno)',
    'category': 'Brinquedos',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Dominó',
    'category': 'Brinquedos',
    'subcategory': 'Jogos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Boneca Barbie',
    'category': 'Brinquedos',
    'subcategory': 'Bonecos/Bonecas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Boneco de Ação (Marvel)',
    'category': 'Brinquedos',
    'subcategory': 'Bonecos/Bonecas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Boneca de Pano',
    'category': 'Brinquedos',
    'subcategory': 'Bonecos/Bonecas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Carrinho de Controle Remoto',
    'category': 'Brinquedos',
    'subcategory': 'Eletrônicos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Console de Videogame (PlayStation)',
    'category': 'Brinquedos',
    'subcategory': 'Eletrônicos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Console de Videogame (Xbox)',
    'category': 'Brinquedos',
    'subcategory': 'Eletrônicos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo para Videogame (Fifa)',
    'category': 'Brinquedos',
    'subcategory': 'Eletrônicos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Montar (Lego)',
    'category': 'Brinquedos',
    'subcategory': 'Montar',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Massinha de Modelar (Play-Doh)',
    'category': 'Brinquedos',
    'subcategory': 'Montar',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Triciclo',
    'category': 'Brinquedos',
    'subcategory': 'Ar Livre',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Piscina de Bolinhas',
    'category': 'Brinquedos',
    'subcategory': 'Ar Livre',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tenda Infantil',
    'category': 'Brinquedos',
    'subcategory': 'Ar Livre',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Instrumento Musical Infantil',
    'category': 'Brinquedos',
    'subcategory': 'Música',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fantasia Infantil',
    'category': 'Brinquedos',
    'subcategory': 'Fantasias',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Miniatura Colecionável',
    'category': 'Brinquedos',
    'subcategory': 'Colecionáveis',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vaso de Planta',
    'category': 'Jardinagem',
    'subcategory': 'Vasos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Semente de Flores',
    'category': 'Jardinagem',
    'subcategory': 'Sementes',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Semente de Hortaliças',
    'category': 'Jardinagem',
    'subcategory': 'Sementes',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Adubo Orgânico',
    'category': 'Jardinagem',
    'subcategory': 'Adubos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Adubo Químico',
    'category': 'Jardinagem',
    'subcategory': 'Adubos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Terra Vegetal',
    'category': 'Jardinagem',
    'subcategory': 'Insumos',
    'availableUnits': ['kg'],
    'defaultUnit': 'kg'
  },
  {
    'name': 'Pulverizador',
    'category': 'Jardinagem',
    'subcategory': 'Equipamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mangueira',
    'category': 'Jardinagem',
    'subcategory': 'Equipamentos',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Pá de Jardinagem',
    'category': 'Jardinagem',
    'subcategory': 'Ferramentas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enxada',
    'category': 'Jardinagem',
    'subcategory': 'Ferramentas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tesoura de Poda',
    'category': 'Jardinagem',
    'subcategory': 'Ferramentas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Regador',
    'category': 'Jardinagem',
    'subcategory': 'Equipamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bomba Pulverizadora',
    'category': 'Jardinagem',
    'subcategory': 'Equipamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Luvas de Jardinagem',
    'category': 'Jardinagem',
    'subcategory': 'Equipamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Violão Acústico',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Cordas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guitarra Elétrica',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Cordas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Baixo Elétrico',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Cordas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ukulele',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Cordas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bateria Acústica',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Percussão',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bateria Eletrônica',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Percussão',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cajon',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Percussão',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pandeiro',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Percussão',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Afinador de Violão',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capa para Instrumento',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Correia para Guitarra',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Palheta',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Amplificador',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cabo para Instrumento',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bag para Bateria',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Baquetas',
    'category': 'Instrumentos Musicais',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vela de Aniversário',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Faixa Decorativa',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Painel Decorativo',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Toalha de Mesa Decorada',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Prato Descartável',
    'category': 'Artigos para Festas',
    'subcategory': 'Descartáveis',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Copo Descartável',
    'category': 'Artigos para Festas',
    'subcategory': 'Descartáveis',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Garfo Descartável',
    'category': 'Artigos para Festas',
    'subcategory': 'Descartáveis',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Guardanapo',
    'category': 'Artigos para Festas',
    'subcategory': 'Descartáveis',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Balão de Látex',
    'category': 'Artigos para Festas',
    'subcategory': 'Balões',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Balão Metalizado',
    'category': 'Artigos para Festas',
    'subcategory': 'Balões',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bomba para Inflar Balões',
    'category': 'Artigos para Festas',
    'subcategory': 'Balões',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Gás Hélio',
    'category': 'Artigos para Festas',
    'subcategory': 'Balões',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Forminha para Doces',
    'category': 'Artigos para Festas',
    'subcategory': 'Doces',
    'availableUnits': ['pct'],
    'defaultUnit': 'pct'
  },
  {
    'name': 'Vasilhas para Bolo/Doce',
    'category': 'Artigos para Festas',
    'subcategory': 'Doces',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Confetes',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lembrancinhas',
    'category': 'Artigos para Festas',
    'subcategory': 'Outros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Convites',
    'category': 'Artigos para Festas',
    'subcategory': 'Outros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Velas Temáticas',
    'category': 'Artigos para Festas',
    'subcategory': 'Decoração',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Linha para Costura',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Agulha de Crochê',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tesoura para Artesanato',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cola para Artesanato',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pincel',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tecido Tricoline',
    'category': 'Artesanato',
    'subcategory': 'Tecidos',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Tecido Feltro',
    'category': 'Artesanato',
    'subcategory': 'Tecidos',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Tecido Jeans',
    'category': 'Artesanato',
    'subcategory': 'Tecidos',
    'availableUnits': ['m'],
    'defaultUnit': 'm'
  },
  {
    'name': 'Tinta para Tecido',
    'category': 'Artesanato',
    'subcategory': 'Tintas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tinta Acrílica',
    'category': 'Artesanato',
    'subcategory': 'Tintas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Tinta PVA',
    'category': 'Artesanato',
    'subcategory': 'Tintas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Verniz',
    'category': 'Artesanato',
    'subcategory': 'Tintas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Máquina de Costura',
    'category': 'Artesanato',
    'subcategory': 'Equipamentos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Agulha de Tricô',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fio de Lã',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Botões',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Enchimento para Almofadas',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Miçangas',
    'category': 'Artesanato',
    'subcategory': 'Materiais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Romance',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Suspense',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Ficção Científica',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fantasia',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Biografia',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mangá',
    'category': 'Livros e Revistas',
    'subcategory': 'Literatura',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Revista de Moda',
    'category': 'Livros e Revistas',
    'subcategory': 'Revistas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Revista de Saúde',
    'category': 'Livros e Revistas',
    'subcategory': 'Revistas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Revista de Culinária',
    'category': 'Livros e Revistas',
    'subcategory': 'Revistas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Revista de Decoração',
    'category': 'Livros e Revistas',
    'subcategory': 'Revistas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Gibi Turma da Mônica',
    'category': 'Livros e Revistas',
    'subcategory': 'Quadrinhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'HQ Marvel',
    'category': 'Livros e Revistas',
    'subcategory': 'Quadrinhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'HQ DC Comics',
    'category': 'Livros e Revistas',
    'subcategory': 'Quadrinhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mangá',
    'category': 'Livros e Revistas',
    'subcategory': 'Quadrinhos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Livro de Receitas',
    'category': 'Livros e Revistas',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guia de Viagem',
    'category': 'Livros e Revistas',
    'subcategory': 'Livros',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Lençol (Casal)',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Lençol (Solteiro)',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Edredom (Casal)',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Edredom (Solteiro)',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Travesseiro',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fronha',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Toalha de Mesa',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Guardanapo de Tecido',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo Americano',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un', 'pct'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capa para Cadeira',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Toalha de Banho',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Banho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Toalha de Rosto',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Banho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Piso para Banheiro',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Banho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Roupão',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Banho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Colcha',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Manta',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capa de Edredom',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Cama',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lugar Americano',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Pano de Copa',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Mesa',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Toalha de Lavabo',
    'category': 'Cama, Mesa e Banho',
    'subcategory': 'Banho',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Assistente Virtual (Amazon Echo)',
    'category': 'Casa Inteligente',
    'subcategory': 'Assistentes Virtuais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Assistente Virtual (Google Home)',
    'category': 'Casa Inteligente',
    'subcategory': 'Assistentes Virtuais',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Câmera de Segurança Interna',
    'category': 'Casa Inteligente',
    'subcategory': 'Câmeras de Segurança',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Câmera de Segurança Externa',
    'category': 'Casa Inteligente',
    'subcategory': 'Câmeras de Segurança',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Lâmpada Inteligente Wi-Fi',
    'category': 'Casa Inteligente',
    'subcategory': 'Lâmpadas Inteligentes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Smart Lâmpada Inteligente Bluetooth',
    'category': 'Casa Inteligente',
    'subcategory': 'Lâmpadas Inteligentes',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fechadura Eletrônica com Senha',
    'category': 'Casa Inteligente',
    'subcategory': 'Fechaduras Eletrônicas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fechadura Eletrônica Biométrica',
    'category': 'Casa Inteligente',
    'subcategory': 'Fechaduras Eletrônicas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sensor de Presença',
    'category': 'Casa Inteligente',
    'subcategory': 'Sensores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Sensor de Abertura',
    'category': 'Casa Inteligente',
    'subcategory': 'Sensores',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Smart Controle Universal',
    'category': 'Casa Inteligente',
    'subcategory': 'Controles',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Interruptor Inteligente',
    'category': 'Casa Inteligente',
    'subcategory': 'Controles',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vídeo Porteiro',
    'category': 'Casa Inteligente',
    'subcategory': 'Segurança',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Whey Protein Concentrado',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Proteínas',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Whey Protein Isolado',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Proteínas',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Creatina',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Proteínas',
    'availableUnits': ['un', 'g'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Albumina',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Proteínas',
    'availableUnits': ['un', 'g'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Multivitamínico',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Vitaminas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vitamina D',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Vitaminas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Vitamina C',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Vitaminas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'BCAA',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Aminoácidos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Glutamina',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Aminoácidos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cafeína',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Energéticos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Maltodextrina',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Energéticos',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'D-Ribose',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Energéticos',
    'availableUnits': ['un', 'kg'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Beta Alanina',
    'category': 'Suplementos Alimentares',
    'subcategory': 'Aminoácidos',
    'availableUnits': ['un', 'g'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Bolsa Transversal',
    'category': 'Acessórios de Moda',
    'subcategory': 'Bolsas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mochila',
    'category': 'Acessórios de Moda',
    'subcategory': 'Bolsas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Carteira',
    'category': 'Acessórios de Moda',
    'subcategory': 'Bolsas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cinto de Couro',
    'category': 'Acessórios de Moda',
    'subcategory': 'Cintos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cinto de Tecido',
    'category': 'Acessórios de Moda',
    'subcategory': 'Cintos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Óculos de Sol',
    'category': 'Acessórios de Moda',
    'subcategory': 'Óculos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Óculos de Grau',
    'category': 'Acessórios de Moda',
    'subcategory': 'Óculos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Relógio Digital',
    'category': 'Acessórios de Moda',
    'subcategory': 'Relógios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Relógio Analógico',
    'category': 'Acessórios de Moda',
    'subcategory': 'Relógios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Chapéu',
    'category': 'Acessórios de Moda',
    'subcategory': 'Chapéus',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Boné',
    'category': 'Acessórios de Moda',
    'subcategory': 'Chapéus',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Cinto Social',
    'category': 'Acessórios de Moda',
    'subcategory': 'Cintos',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa de Som Bluetooth',
    'category': 'Áudio e Som',
    'subcategory': 'Caixas de Som',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Caixa de Som Amplificada',
    'category': 'Áudio e Som',
    'subcategory': 'Caixas de Som',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fone de Ouvido Sem Fio',
    'category': 'Áudio e Som',
    'subcategory': 'Fones de Ouvido',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Fone de Ouvido Headphone',
    'category': 'Áudio e Som',
    'subcategory': 'Fones de Ouvido',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Microfone Condensador',
    'category': 'Áudio e Som',
    'subcategory': 'Microfones',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Microfone Dinâmico',
    'category': 'Áudio e Som',
    'subcategory': 'Microfones',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mesa de Som Analógica',
    'category': 'Áudio e Som',
    'subcategory': 'Mesa de Som',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Mesa de Som Digital',
    'category': 'Áudio e Som',
    'subcategory': 'Mesa de Som',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Home Theater',
    'category': 'Áudio e Som',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Karaokê',
    'category': 'Áudio e Som',
    'subcategory': 'Acessórios',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Furadeira de Impacto Profissional',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Ferramentas Elétricas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Esmerilhadeira Angular Profissional',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Ferramentas Elétricas',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Chave de Boca',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Ferramentas Manuais',
    'availableUnits': ['un', 'jogo'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Jogo de Chaves Allen',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Ferramentas Manuais',
    'availableUnits': ['un', 'jogo'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Multímetro Digital',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Equipamentos de Medição',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Trena a Laser',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'Equipamentos de Medição',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Capacete de Segurança',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Luva de Raspa',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['par'],
    'defaultUnit': 'par'
  },
  {
    'name': 'Botina de Segurança',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['par'],
    'defaultUnit': 'par'
  },
  {
    'name': 'Óculos de Proteção',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Avental de Raspa',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
  {
    'name': 'Máscara de Solda',
    'category': 'Ferramentas Profissionais',
    'subcategory': 'EPIs',
    'availableUnits': ['un'],
    'defaultUnit': 'un'
  },
];
