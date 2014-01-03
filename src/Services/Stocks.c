/* Stocks.c generated by valac 0.20.1, the Vala compiler
 * generated from Stocks.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <clutter/clutter.h>
#include <libsoup/soup.h>
#include <glib/gi18n-lib.h>
#include <float.h>
#include <math.h>


#define TYPE_SERVICE (service_get_type ())
#define SERVICE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_SERVICE, Service))
#define SERVICE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_SERVICE, ServiceClass))
#define IS_SERVICE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_SERVICE))
#define IS_SERVICE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_SERVICE))
#define SERVICE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_SERVICE, ServiceClass))

typedef struct _Service Service;
typedef struct _ServiceClass ServiceClass;
typedef struct _ServicePrivate ServicePrivate;

#define TYPE_STOCKS (stocks_get_type ())
#define STOCKS(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_STOCKS, Stocks))
#define STOCKS_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_STOCKS, StocksClass))
#define IS_STOCKS(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_STOCKS))
#define IS_STOCKS_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_STOCKS))
#define STOCKS_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_STOCKS, StocksClass))

typedef struct _Stocks Stocks;
typedef struct _StocksClass StocksClass;
typedef struct _StocksPrivate StocksPrivate;

#define TYPE_SHADOWED_LABEL (shadowed_label_get_type ())
#define SHADOWED_LABEL(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_SHADOWED_LABEL, ShadowedLabel))
#define SHADOWED_LABEL_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_SHADOWED_LABEL, ShadowedLabelClass))
#define IS_SHADOWED_LABEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_SHADOWED_LABEL))
#define IS_SHADOWED_LABEL_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_SHADOWED_LABEL))
#define SHADOWED_LABEL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_SHADOWED_LABEL, ShadowedLabelClass))

typedef struct _ShadowedLabel ShadowedLabel;
typedef struct _ShadowedLabelClass ShadowedLabelClass;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))

struct _Service {
	ClutterActor parent_instance;
	ServicePrivate * priv;
};

struct _ServiceClass {
	ClutterActorClass parent_class;
	void (*create) (Service* self);
	gboolean (*update) (Service* self);
};

struct _Stocks {
	Service parent_instance;
	StocksPrivate * priv;
};

struct _StocksClass {
	ServiceClass parent_class;
};

struct _StocksPrivate {
	SoupSession* session;
	SoupMessage* message;
	ShadowedLabel* reload;
	ShadowedLabel* main_label;
	ShadowedLabel* stocks_list;
};


static gpointer stocks_parent_class = NULL;

#define stocks_watch "AAPL,GOOG,MSFT"
GType service_get_type (void) G_GNUC_CONST;
GType stocks_get_type (void) G_GNUC_CONST;
GType shadowed_label_get_type (void) G_GNUC_CONST;
#define STOCKS_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), TYPE_STOCKS, StocksPrivate))
enum  {
	STOCKS_DUMMY_PROPERTY
};
Stocks* stocks_new (void);
Stocks* stocks_construct (GType object_type);
Service* service_construct (GType object_type, const gchar* _id);
gboolean service_load (Service* self);
static void stocks_real_create (Service* base);
#define textcolor "black"
ShadowedLabel* shadowed_label_new (const gchar* _label);
ShadowedLabel* shadowed_label_construct (GType object_type, const gchar* _label);
ShadowedLabel* service_get_reload_label (Service* self, const gchar* service_name);
gboolean service_update (Service* self);
static gboolean _service_update_gsource_func (gpointer self);
static gboolean stocks_real_update (Service* base);
static void stocks_finalize (GObject* obj);


Stocks* stocks_construct (GType object_type) {
	Stocks * self = NULL;
	self = (Stocks*) service_construct (object_type, "stocks");
	service_load ((Service*) self);
	return self;
}


Stocks* stocks_new (void) {
	return stocks_construct (TYPE_STOCKS);
}


static gboolean _service_update_gsource_func (gpointer self) {
	gboolean result;
	result = service_update (self);
	return result;
}


static void stocks_real_create (Service* base) {
	Stocks * self;
	const gchar* _tmp0_ = NULL;
	gchar* _tmp1_ = NULL;
	gchar* _tmp2_;
	gchar* _tmp3_;
	gchar* _tmp4_;
	ShadowedLabel* _tmp5_;
	ShadowedLabel* _tmp6_;
	ShadowedLabel* main_label;
	ShadowedLabel* _tmp7_;
	ShadowedLabel* stocks_list;
	gfloat _tmp8_;
	gfloat _tmp9_;
	const gchar* _tmp10_ = NULL;
	ShadowedLabel* _tmp11_ = NULL;
	self = (Stocks*) base;
	_tmp0_ = _ ("Stocks");
	_tmp1_ = g_strdup_printf ("' font='20' face='Raleway'>%s</span>", _tmp0_);
	_tmp2_ = _tmp1_;
	_tmp3_ = g_strconcat ("<span color='" textcolor, _tmp2_, NULL);
	_tmp4_ = _tmp3_;
	_tmp5_ = shadowed_label_new (_tmp4_);
	g_object_ref_sink (_tmp5_);
	_tmp6_ = _tmp5_;
	_g_free0 (_tmp4_);
	_g_free0 (_tmp2_);
	main_label = _tmp6_;
	_tmp7_ = shadowed_label_new ("");
	g_object_ref_sink (_tmp7_);
	stocks_list = _tmp7_;
	_tmp8_ = clutter_actor_get_height ((ClutterActor*) main_label);
	_tmp9_ = _tmp8_;
	clutter_actor_set_y ((ClutterActor*) stocks_list, _tmp9_ + 12);
	clutter_actor_set_x ((ClutterActor*) stocks_list, (gfloat) 12);
	_tmp10_ = _ ("stocks");
	_tmp11_ = service_get_reload_label ((Service*) self, _tmp10_);
	_g_object_unref0 (self->priv->reload);
	self->priv->reload = _tmp11_;
	clutter_actor_add_child ((ClutterActor*) self, (ClutterActor*) main_label);
	clutter_actor_add_child ((ClutterActor*) self, (ClutterActor*) stocks_list);
	g_timeout_add_full (G_PRIORITY_DEFAULT, (guint) 10000, _service_update_gsource_func, g_object_ref ((Service*) self), g_object_unref);
	_g_object_unref0 (stocks_list);
	_g_object_unref0 (main_label);
}


static gboolean stocks_real_update (Service* base) {
	Stocks * self;
	gboolean result = FALSE;
	gchar* _tmp0_;
	gchar* soup_url;
	const gchar* _tmp1_;
	SoupMessage* _tmp2_;
	SoupMessage* _tmp3_;
	SoupMessageBody* _tmp4_;
	guint8* _tmp5_;
	gint _tmp5__length1;
	gchar* _tmp6_;
	gchar* output;
	const gchar* _tmp7_;
	const gchar* _tmp10_;
	self = (Stocks*) base;
	g_debug ("Stocks.vala:33: Updating stocks...");
	_tmp0_ = g_strdup ("http://download.finance.yahoo.com/d/quotes.csv?s=%40%5E" stocks_watch "&f=nsl1op&e=.csv");
	soup_url = _tmp0_;
	_tmp1_ = soup_url;
	_tmp2_ = soup_message_new ("GET", _tmp1_);
	_g_object_unref0 (self->priv->message);
	self->priv->message = _tmp2_;
	_tmp3_ = self->priv->message;
	_tmp4_ = _tmp3_->response_body;
	_tmp5_ = _tmp4_->data;
	_tmp5__length1 = (gint) _tmp4_->length;
	_tmp6_ = g_strdup ((const gchar*) _tmp5_);
	output = _tmp6_;
	_tmp7_ = output;
	if (_tmp7_ == NULL) {
		ShadowedLabel* _tmp8_;
		ShadowedLabel* _tmp9_;
		_tmp8_ = self->priv->stocks_list;
		clutter_actor_hide ((ClutterActor*) _tmp8_);
		_tmp9_ = self->priv->reload;
		clutter_actor_show ((ClutterActor*) _tmp9_);
		result = FALSE;
		_g_free0 (output);
		_g_free0 (soup_url);
		return result;
	}
	_tmp10_ = output;
	g_print ("%s", _tmp10_);
	result = TRUE;
	_g_free0 (output);
	_g_free0 (soup_url);
	return result;
}


static void stocks_class_init (StocksClass * klass) {
	stocks_parent_class = g_type_class_peek_parent (klass);
	g_type_class_add_private (klass, sizeof (StocksPrivate));
	SERVICE_CLASS (klass)->create = stocks_real_create;
	SERVICE_CLASS (klass)->update = stocks_real_update;
	G_OBJECT_CLASS (klass)->finalize = stocks_finalize;
}


static void stocks_instance_init (Stocks * self) {
	self->priv = STOCKS_GET_PRIVATE (self);
}


static void stocks_finalize (GObject* obj) {
	Stocks * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, TYPE_STOCKS, Stocks);
	_g_object_unref0 (self->priv->session);
	_g_object_unref0 (self->priv->message);
	_g_object_unref0 (self->priv->reload);
	_g_object_unref0 (self->priv->main_label);
	_g_object_unref0 (self->priv->stocks_list);
	G_OBJECT_CLASS (stocks_parent_class)->finalize (obj);
}


GType stocks_get_type (void) {
	static volatile gsize stocks_type_id__volatile = 0;
	if (g_once_init_enter (&stocks_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (StocksClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) stocks_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (Stocks), 0, (GInstanceInitFunc) stocks_instance_init, NULL };
		GType stocks_type_id;
		stocks_type_id = g_type_register_static (TYPE_SERVICE, "Stocks", &g_define_type_info, 0);
		g_once_init_leave (&stocks_type_id__volatile, stocks_type_id);
	}
	return stocks_type_id__volatile;
}



