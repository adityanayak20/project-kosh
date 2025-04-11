# Stage 1: Install dependencies
FROM node:20-alpine AS deps
WORKDIR /app

# Copy package.json and lock file
COPY package.json package-lock.json* ./

# Install dependencies using npm ci for consistency
RUN npm ci

# Stage 2: Build the application
FROM node:20-alpine AS builder
WORKDIR /app

# Copy dependencies from the previous stage
COPY --from=deps /app/node_modules ./node_modules

# Copy the rest of the application code
COPY . .

# Set NODE_ENV to production for build optimization
ENV NODE_ENV production

# Build the Next.js application (this will create the .next folder with standalone output)
RUN npm run build

# Stage 3: Production image
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV production
# Optionally set port, Next.js default is 3000
# ENV PORT 3000

# Create a non-root user for security
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy the standalone output from the builder stage
# Important: Change ownership to the non-root user
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./

# Copy the static assets generated during build
# These are needed by the standalone server
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Copy public assets
COPY --from=builder --chown=nextjs:nodejs /app/public ./public

# Set the non-root user
USER nextjs

# Expose the port the app runs on
EXPOSE 3000

# Command to run the standalone server
CMD ["node", "server.js"]