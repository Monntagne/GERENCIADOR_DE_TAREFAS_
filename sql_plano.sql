-- ============================================================
-- SQL para adicionar sistema de planos na tabela 'perfis'
-- Execute no SQL Editor do Supabase Dashboard
-- ============================================================

-- 1. Adicionar coluna 'plano' (gratis | pro | premium)
ALTER TABLE perfis
ADD COLUMN IF NOT EXISTS plano TEXT NOT NULL DEFAULT 'gratis'
CHECK (plano IN ('gratis', 'pro', 'premium'));

-- 2. Adicionar coluna 'papel' (usuario | admin)
ALTER TABLE perfis
ADD COLUMN IF NOT EXISTS papel TEXT NOT NULL DEFAULT 'usuario'
CHECK (papel IN ('usuario', 'admin'));

-- 3. Adicionar coluna 'funcoes_liberadas' (array de funcionalidades liberadas manualmente pelo admin)
ALTER TABLE perfis
ADD COLUMN IF NOT EXISTS funcoes_liberadas TEXT[] NOT NULL DEFAULT '{}';

-- 4. (Opcional) Definir seu próprio usuário como admin
-- Substitua 'SEU_USUARIO' pelo seu nome de usuario
-- UPDATE perfis SET papel = 'admin' WHERE usuario = 'SEU_USUARIO';

-- 5. Verificar
SELECT usuario, plano, papel, funcoes_liberadas FROM perfis LIMIT 10;
