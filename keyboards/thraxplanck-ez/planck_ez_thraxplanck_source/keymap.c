#include QMK_KEYBOARD_H
#ifdef AUDIO_ENABLE
#include "muse.h"
#endif
#include "eeprom.h"
#include "keymap_german.h"
#include "keymap_nordic.h"
#include "keymap_french.h"
#include "keymap_spanish.h"
#include "keymap_hungarian.h"
#include "keymap_swedish.h"
#include "keymap_br_abnt2.h"
#include "keymap_canadian_multilingual.h"
#include "keymap_german_ch.h"
#include "keymap_jp.h"
#include "keymap_bepo.h"

#define KC_MAC_UNDO LGUI(KC_Z)
#define KC_MAC_CUT LGUI(KC_X)
#define KC_MAC_COPY LGUI(KC_C)
#define KC_MAC_PASTE LGUI(KC_V)
#define KC_PC_UNDO LCTL(KC_Z)
#define KC_PC_CUT LCTL(KC_X)
#define KC_PC_COPY LCTL(KC_C)
#define KC_PC_PASTE LCTL(KC_V)
#define ES_LESS_MAC KC_GRAVE
#define ES_GRTR_MAC LSFT(KC_GRAVE)
#define ES_BSLS_MAC ALGR(KC_6)
#define NO_PIPE_ALT KC_GRAVE
#define NO_BSLS_ALT KC_EQUAL

enum planck_keycodes {
  RGB_SLD = EZ_SAFE_RANGE,
};

enum planck_layers {
  _BASE,
  _LOWER,
  _RAISE,
  _ADJUST,
  _LAYER4,
  _LAYER5,
  _LAYER6,
  _LAYER7,
};

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_BASE] = LAYOUT_planck_grid(MT(MOD_MEH, KC_TAB),KC_Q,KC_W,KC_E,KC_R,KC_T,KC_Y,KC_U,KC_I,KC_O,KC_P,KC_BSPACE,LCTL_T(KC_ESCAPE),KC_A,KC_S,KC_D,KC_F,KC_G,KC_H,KC_J,KC_K,KC_L,KC_SCOLON,KC_QUOTE,KC_LSHIFT,KC_Z,KC_X,KC_C,KC_V,KC_B,KC_N,KC_M,KC_COMMA,KC_DOT,KC_SLASH,KC_ENTER,TT(4),KC_LCTRL,KC_LALT,OSM(MOD_LGUI),TT(1),KC_SPACE,KC_NO,TT(2),KC_LEFT,KC_DOWN,KC_UP,KC_RIGHT),

  [_LOWER] = LAYOUT_planck_grid(KC_GRAVE,KC_1,KC_2,KC_3,KC_4,KC_5,KC_6,KC_7,KC_8,KC_9,KC_0,KC_DELETE,TO(0),KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_MINUS,KC_EQUAL,KC_LBRACKET,KC_RBRACKET,KC_BSLASH,KC_LSHIFT,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_COMMA,KC_DOT,KC_SLASH,KC_ENTER,KC_NO,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_TRANSPARENT,LGUI(KC_SPACE),KC_NO,KC_TRANSPARENT,KC_MEDIA_PLAY_PAUSE,KC_AUDIO_VOL_DOWN,KC_AUDIO_VOL_UP,KC_AUDIO_MUTE),

  [_RAISE] = LAYOUT_planck_grid(KC_TILD,KC_EXLM,KC_AT,KC_HASH,KC_DLR,KC_PERC,KC_CIRC,KC_AMPR,KC_ASTR,KC_LPRN,KC_RPRN,KC_DELETE,TO(0),KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_UNDS,KC_PLUS,KC_LCBR,KC_RCBR,KC_PIPE,KC_LSHIFT,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_COMMA,KC_DOT,KC_SLASH,KC_ENTER,KC_NO,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_TRANSPARENT,RGUI(KC_SPACE),KC_NO,KC_TRANSPARENT,KC_MEDIA_PLAY_PAUSE,KC_AUDIO_VOL_DOWN,KC_AUDIO_VOL_UP,KC_AUDIO_MUTE),

  [_ADJUST] = LAYOUT_planck_grid(KC_F1,KC_F2,KC_F3,KC_F4,KC_F5,KC_F6,KC_F7,KC_F8,KC_F9,KC_F10,KC_F11,KC_F12,TO(0),KC_NO,AU_ON,AU_OFF,AU_TOG,KC_NO,KC_NO,RGB_TOG,RGB_VAI,RGB_VAD,KC_NO,RESET,KC_NO,KC_NO,MU_ON,MU_OFF,MU_TOG,KC_NO,KC_NO,RGB_MOD,RGB_HUI,RGB_HUD,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,OSM(MOD_LGUI),KC_TRANSPARENT,KC_NO,KC_NO,KC_TRANSPARENT,KC_NO,KC_NO,KC_NO,KC_NUMLOCK),

  [_LAYER4] = LAYOUT_planck_grid(KC_TAB,KC_NO,LCTL(KC_RIGHT),LCTL(KC_RIGHT),LCTL(LSFT(KC_Z)),KC_NO,LCTL(KC_C),LCTL(KC_Z),TO(0),KC_NO,LCTL(KC_V),KC_LEFT,TO(0),TO(0),KC_NO,KC_NO,KC_NO,KC_NO,KC_LEFT,KC_DOWN,KC_UP,KC_RIGHT,KC_NO,KC_NO,MO(6),KC_NO,KC_DELETE,TO(0),TG(5),LCTL(KC_LEFT),KC_NO,KC_NO,KC_NO,KC_NO,LCTL(KC_F),KC_DOWN,KC_TRANSPARENT,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),DYN_REC_START1,DYN_MACRO_PLAY1,KC_NO,DYN_REC_STOP,TO(0),KC_NO,KC_NO,TG(7)),

  [_LAYER5] = LAYOUT_planck_grid(KC_NO,KC_NO,LCTL(LSFT(KC_RIGHT)),LCTL(LSFT(KC_RIGHT)),KC_NO,KC_NO,LCTL(KC_C),KC_NO,TO(0),KC_NO,LCTL(KC_V),LSFT(KC_LEFT),TO(0),TO(0),KC_NO,LGUI(KC_X),KC_NO,KC_NO,LSFT(KC_LEFT),LSFT(KC_DOWN),LSFT(KC_UP),LSFT(KC_RIGHT),KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,TO(0),KC_TRANSPARENT,LCTL(LSFT(KC_LEFT)),KC_NO,KC_NO,LSFT(KC_TAB),KC_TAB,KC_NO,LSFT(KC_DOWN),TO(4),KC_LCTRL,KC_LALT,OSM(MOD_LGUI),DYN_REC_START1,DYN_MACRO_PLAY1,KC_NO,DYN_REC_STOP,TO(0),KC_NO,KC_NO,TG(7)),

  [_LAYER6] = LAYOUT_planck_grid(KC_NO,KC_NO,LCTL(LSFT(KC_RIGHT)),LCTL(LSFT(KC_RIGHT)),KC_NO,KC_NO,LCTL(LSFT(KC_C)),KC_NO,KC_HOME,KC_NO,LCTL(LSFT(KC_V)),KC_BSPACE,KC_NO,KC_END,KC_NO,KC_NO,KC_NO,KC_PGDOWN,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_TRANSPARENT,KC_NO,KC_BSPACE,KC_NO,KC_NO,LCTL(KC_LEFT),KC_NO,KC_NO,LCTL(LGUI(KC_LEFT)),LCTL(LGUI(KC_RIGHT)),KC_NO,KC_ENTER,KC_NO,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO),

  [_LAYER7] = LAYOUT_planck_grid(KC_NO,LGUI(LSFT(KC_Q)),LGUI(KC_W),LGUI(KC_E),LGUI(LSFT(KC_R)),LGUI(KC_ENTER),KC_NO,KC_NO,KC_NO,KC_NO,LCTL(LGUI(KC_LEFT)),LGUI(KC_PSCREEN),TO(0),LGUI(KC_1),LGUI(KC_2),LGUI(KC_3),LGUI(KC_4),LGUI(KC_5),LGUI(KC_LEFT),LGUI(KC_UP),LGUI(KC_DOWN),LGUI(KC_RIGHT),KC_NO,LGUI(KC_F2),KC_LSHIFT,KC_NO,KC_NO,LGUI(LSFT(KC_C)),KC_NO,KC_NO,LALT(LCTL(KC_N)),KC_NO,LALT(LCTL(KC_COMMA)),LALT(LCTL(KC_DOT)),KC_NO,LGUI(KC_D),TO(4),KC_NO,KC_NO,KC_NO,KC_NO,LGUI(KC_D),KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,KC_TRANSPARENT),

};

extern bool g_suspend_state;
extern rgb_config_t rgb_matrix_config;

void keyboard_post_init_user(void) {
  rgb_matrix_enable();
}

const uint8_t PROGMEM ledmap[][DRIVER_LED_TOTAL][3] = {
    [0] = { {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {141,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {15,97,236}, {180,255,233}, {14,222,242}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233} },

    [1] = { {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {0,0,0}, {15,97,236}, {15,97,236}, {15,97,236}, {180,255,233}, {15,97,236}, {233,218,217}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236} },

    [2] = { {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {0,0,0}, {14,222,242}, {14,222,242}, {14,222,242}, {233,218,217}, {14,222,242}, {180,255,233}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242} },

    [3] = { {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {233,218,217}, {180,255,233}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {255,220,201}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {0,0,0}, {233,218,217}, {0,0,0}, {0,0,0}, {0,0,0}, {233,218,217} },

    [4] = { {141,255,233}, {0,0,0}, {141,255,233}, {141,255,233}, {141,255,233}, {0,0,0}, {141,255,233}, {141,255,233}, {180,255,233}, {0,0,0}, {141,255,233}, {141,255,233}, {180,255,233}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {141,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {141,255,233}, {180,255,233}, {169,120,255}, {141,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {141,255,233}, {141,255,233}, {180,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {146,224,255}, {146,224,255}, {146,224,255}, {180,255,233}, {0,0,0}, {0,0,0}, {154,255,255} },

    [5] = { {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {0,0,0}, {180,255,233}, {0,0,0}, {169,120,255}, {169,120,255}, {180,255,233}, {180,255,233}, {0,0,0}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {180,255,233}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {0,0,0}, {169,120,255}, {141,255,233}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {180,255,233}, {0,0,0}, {0,0,0}, {154,255,255} },

    [6] = { {0,0,0}, {0,0,0}, {85,203,158}, {85,203,158}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {85,203,158}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {85,203,158}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0} },

    [7] = { {0,0,0}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {154,255,255}, {154,255,255}, {180,255,233}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {154,255,255}, {0,0,0}, {154,255,255}, {154,255,255}, {0,0,0}, {0,0,0}, {154,255,255}, {0,0,0}, {0,0,0}, {154,255,255}, {0,0,0}, {154,255,255}, {154,255,255}, {0,0,0}, {154,255,255}, {141,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {154,255,255}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {154,255,255} },

};

void set_layer_color(int layer) {
  for (int i = 0; i < DRIVER_LED_TOTAL; i++) {
    HSV hsv = {
      .h = pgm_read_byte(&ledmap[layer][i][0]),
      .s = pgm_read_byte(&ledmap[layer][i][1]),
      .v = pgm_read_byte(&ledmap[layer][i][2]),
    };
    if (!hsv.h && !hsv.s && !hsv.v) {
        rgb_matrix_set_color( i, 0, 0, 0 );
    } else {
        RGB rgb = hsv_to_rgb( hsv );
        float f = (float)rgb_matrix_config.hsv.v / UINT8_MAX;
        rgb_matrix_set_color( i, f * rgb.r, f * rgb.g, f * rgb.b );
    }
  }
}

void rgb_matrix_indicators_user(void) {
  if (g_suspend_state || keyboard_config.disable_layer_led) { return; }
  switch (biton32(layer_state)) {
    case 0:
      set_layer_color(0);
      break;
    case 1:
      set_layer_color(1);
      break;
    case 2:
      set_layer_color(2);
      break;
    case 3:
      set_layer_color(3);
      break;
    case 4:
      set_layer_color(4);
      break;
    case 5:
      set_layer_color(5);
      break;
    case 6:
      set_layer_color(6);
      break;
    case 7:
      set_layer_color(7);
      break;
   default:
    if (rgb_matrix_get_flags() == LED_FLAG_NONE)
      rgb_matrix_set_color_all(0, 0, 0);
    break;
  }
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case RGB_SLD:
      if (record->event.pressed) {
        rgblight_mode(1);
      }
      return false;
  }
  return true;
}

#ifdef AUDIO_ENABLE
bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update(bool clockwise) {
    if (muse_mode) {
        if (IS_LAYER_ON(_RAISE)) {
            if (clockwise) {
                muse_offset++;
            } else {
                muse_offset--;
            }
        } else {
            if (clockwise) {
                muse_tempo+=1;
            } else {
                muse_tempo-=1;
            }
        }
    } else {
        if (clockwise) {
        #ifdef MOUSEKEY_ENABLE
            register_code(KC_MS_WH_DOWN);
            unregister_code(KC_MS_WH_DOWN);
        #else
            register_code(KC_PGDN);
            unregister_code(KC_PGDN);
        #endif
        } else {
        #ifdef MOUSEKEY_ENABLE
            register_code(KC_MS_WH_UP);
            unregister_code(KC_MS_WH_UP);
        #else
            register_code(KC_PGUP);
            unregister_code(KC_PGUP);
        #endif
        }
    }
}

void matrix_scan_user(void) {
#ifdef AUDIO_ENABLE
    if (muse_mode) {
        if (muse_counter == 0) {
            uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
            if (muse_note != last_muse_note) {
                stop_note(compute_freq_for_midi_note(last_muse_note));
                play_note(compute_freq_for_midi_note(muse_note), 0xF);
                last_muse_note = muse_note;
            }
        }
        muse_counter = (muse_counter + 1) % muse_tempo;
    }
#endif
}

bool music_mask_user(uint16_t keycode) {
    switch (keycode) {
    case RAISE:
    case LOWER:
        return false;
    default:
        return true;
    }
}
#endif

uint32_t layer_state_set_user(uint32_t state) {
    return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}
