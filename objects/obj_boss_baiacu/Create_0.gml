/// @description Inicialização das variáveis do Chefe Baiacu

event_inherited();

// --- Atributos de Combate ---
max_vida = 100 * global.dificuldade;
vida_atual = max_vida;
pode_levar_dano = true;

// --- Controle de Estado e IA ---
estado = "parado";
ataque_estado = 0;
timer_estado = 0;
_atordou = false;
stun_timer = 0;
stun_duration = 300;

// --- Catálogo de Falas Aleatórias (Versão Expandida) ---
falas_encontro = [
    "Quem ousa perturbar meu sono eterno?",
    "Um mortal... que audácia.",
    "As profundezas te aguardam."
];
falas_ataque_distancia = [
    "Sinta a fúria do rio!",
    "As águas te consumirão!",
    "Não desvie desta!"
];
falas_ataque_perto = [
    "Não irá escapar!",
    "Para trás, insolente!",
    "Sinta minha força!"
];
falas_hit = [
    "Ugh!",
    "Apenas um arranhão...",
    "Tolo!",
    "Sua lâmina é fraca."
];
falas_provocacao = [
    "E pensar que aquele bruxo achou que podia me controlar... Assim como você.",
    "Meu poder esteve adormecido, não perdido.",
    "Volte para sua vila. Este rio não te pertence."
];
falas_atordoado = [ // Frases para o momento de vulnerabilidade
    "Como...? A magia... o selo do bruxo... está quebrando!",
    "Essa força... não é de um simples mortal.",
    "O poder... vaza... Ugh!"
];
falas_morte = [
    "Enfim... livre... do feitiço...",
    "O rio... me reclama... para o grande... silêncio...",
    "Então... este é o poder... dos novos tempos..."
];

// --- Variáveis de Sistema ---
fala_atual = "";
fala_timer = 0;
part_sys_morte = -1;